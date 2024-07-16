package com.cyber.escape.domain.chat.repository;

import com.cyber.escape.domain.chat.entity.Participants;
import com.cyber.escape.domain.chat.entity.QChatRoom;
import com.cyber.escape.domain.chat.entity.QParticipants;
import com.querydsl.jpa.impl.JPAQueryFactory;

import java.util.Optional;
import java.util.UUID;

public class ParticipantsRepositoryImpl implements ParticipantsRepositoryCustom {
    private final JPAQueryFactory jpaQueryFactory;

    public ParticipantsRepositoryImpl(JPAQueryFactory jpaQueryFactory) {
        this.jpaQueryFactory = jpaQueryFactory;
    }

    public Optional<Participants> existsByUserUuidAndChatRoomUuid(UUID userUuid, UUID chatRoomUuid){

        QParticipants participants = QParticipants.participants;
        QChatRoom chatRoom = QChatRoom.chatRoom;

        return Optional.ofNullable(
                jpaQueryFactory
                        .selectFrom(participants)
                        .join(chatRoom).on(participants.chatRoom.uuid.eq(chatRoom.uuid))
                        .where(chatRoom.uuid.eq(chatRoomUuid)
                                .and(participants.participant.uuid.eq(userUuid))
                                .and(participants.deleteFlag.eq(false)))
                        .fetchOne());

    }

}
