package com.cyber.escape.domain.chat.dto;

import com.querydsl.core.annotations.QueryProjection;
import lombok.Getter;

import java.util.UUID;

public class ParticipantDto {


    @Getter
    public static class ParticipantsDto{

        private final UUID userUuid;
        private final String nickname;

        @QueryProjection
        public ParticipantsDto(UUID userUuid, String nickname){
            this.userUuid = userUuid;
            this.nickname = nickname;
        }
    }

}
