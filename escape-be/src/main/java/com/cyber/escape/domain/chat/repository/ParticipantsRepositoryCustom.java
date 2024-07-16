package com.cyber.escape.domain.chat.repository;

import com.cyber.escape.domain.chat.entity.Participants;

import java.util.Optional;
import java.util.UUID;

public interface ParticipantsRepositoryCustom {
    Optional<Participants> existsByUserUuidAndChatRoomUuid(UUID userUuid, UUID chatRoomUuid);
}
