package com.cyber.escape.domain.chat.repository;

import com.cyber.escape.domain.chat.dto.ChatRoomDto;
import com.cyber.escape.domain.chat.entity.ChatRoom;
import com.cyber.escape.global.exception.ChatException;

import java.util.List;
import java.util.UUID;

public interface ChatRoomRepositoryCustom {
    // 1대1 채팅
    ChatRoom findRoomInfoBelongto(UUID myUuid, UUID friendUuid) throws ChatException;
    void exitRoom(UUID roomUuid, UUID exitUuid);

    List<ChatRoomDto.MyChatListDto> getMyChatList(UUID userUuid);

}
