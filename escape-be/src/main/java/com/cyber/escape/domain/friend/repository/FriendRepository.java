package com.cyber.escape.domain.friend.repository;

import com.cyber.escape.domain.friend.entity.Friend;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface FriendRepository extends JpaRepository<Friend, String>, FriendRepositoryCustom {
    @Query(value = "SELECT f.* " +
        "FROM friend f " +
        "JOIN user u ON f.from_user_id = u.id " +
        "JOIN user s ON f.to_user_id = s.id " +
        "WHERE s.uuid = :receiver AND u.uuid = :sender", nativeQuery = true)
    Optional<Friend> getFriend(@Param("sender") UUID sender, @Param("receiver") UUID receiver);


}
