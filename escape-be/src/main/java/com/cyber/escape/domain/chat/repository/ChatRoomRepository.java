package com.cyber.escape.domain.chat.repository;

import com.cyber.escape.domain.chat.entity.ChatRoom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface ChatRoomRepository extends JpaRepository<ChatRoom, Long> {

    Optional<Long> findIdByUuid(UUID uuid);

    Optional<ChatRoom> findByUuid(UUID uuid);

}
