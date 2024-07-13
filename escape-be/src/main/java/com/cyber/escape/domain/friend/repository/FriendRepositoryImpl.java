package com.cyber.escape.domain.friend.repository;

import com.cyber.escape.domain.auth.util.UuidUtil;
import com.cyber.escape.domain.friend.dto.FriendDto;
import com.cyber.escape.domain.friend.dto.QFriendDto_FriendListResponse;
import com.cyber.escape.domain.friend.entity.Friend;
import com.cyber.escape.domain.friend.entity.QFriend;
import com.cyber.escape.domain.friend.entity.QFriendDeleteHistory;
import com.cyber.escape.domain.user.entity.QUser;
import com.cyber.escape.domain.user.entity.User;
import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
@Slf4j
public class FriendRepositoryImpl implements FriendRepositoryCustom{

    private final JPAQueryFactory jpaQueryFactory;
    private final EntityManager entityManager;

    public FriendRepositoryImpl(JPAQueryFactory jpaQueryFactory, EntityManager entityManager) {
        this.jpaQueryFactory = jpaQueryFactory;
        this.entityManager = entityManager;
    }

    public List<FriendDto.FriendListResponse> findFriendList(UUID uuid){

        QFriend friend = QFriend.friend;
        QFriend other = QFriend.friend;



        List<FriendDto.FriendListResponse> result = jpaQueryFactory
                .select(new QFriendDto_FriendListResponse(friend.receiver.uuid, friend.receiver.nickname, friend.receiver.profileUrl))
                .from(friend)
                .where(friend.sender.uuid.eq(uuid)
                        .and(
                                friend.receiver.in(
                                        JPAExpressions
                                                .select(other.sender)
                                                .from(other)
                                                .where(other.receiver.uuid.eq(uuid))
                                )
                        )
                )
                .fetch();

        String sql = jpaQueryFactory
                .select(new QFriendDto_FriendListResponse(friend.receiver.uuid, friend.receiver.nickname, friend.receiver.profileUrl))
                .from(friend)
                .where(friend.sender.uuid.eq(uuid)
                        .and(
                                friend.receiver.in(
                                        JPAExpressions
                                                .select(other.sender)
                                                .from(other)
                                                .where(other.receiver.uuid.eq(uuid))
                                )
                        )
                ).toString();

        log.info("SQL : {}", sql);

        // 더미데이터 잘못 넣었네
        return result;
    }

    @Transactional
    public void removeFriendAndInsertLogHistory(UUID currentUserUuid, UUID friendUuid){

        QFriendDeleteHistory deleteHistory = QFriendDeleteHistory.friendDeleteHistory;
        QFriend friend = QFriend.friend;

        User sender = entityManager.find(User.class, currentUserUuid);
        User receiver = entityManager.find(User.class, friendUuid);

        try {
            // 친구 리스트에서 삭제
            log.info("Attempting to delete friend relationship between {} and {}", currentUserUuid, friendUuid);
            long deletedCount = jpaQueryFactory
                    .delete(friend)
                    .where(
                            friend.sender.uuid.eq(currentUserUuid).and(friend.receiver.uuid.eq(friendUuid))
                                    .or(friend.sender.uuid.eq(friendUuid).and(friend.receiver.uuid.eq(currentUserUuid)))
                    )
                    .execute();
            log.info("Deleted {} friend relationships", deletedCount);

            // 친구 삭제 히스토리에 저장
            log.info("Logging delete history for sender {} and receiver {}", sender, receiver);

            entityManager.createNativeQuery("INSERT INTO friend_delete_history (from_user_id, to_user_id) VALUES (:sender, :receiver)")
                    .setParameter("sender", currentUserUuid)
                    .setParameter("receiver", friendUuid)
                    .executeUpdate();

            log.info("Successfully logged delete history.");
        } catch (Exception e) {
            log.error("Error during removeFriendAndLogHistory operation: {}", e.getMessage(), e);
            throw e; // 다시 예외를 throw하여 호출자에게 전파
        }
    }
}
