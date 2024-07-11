package com.cyber.escape.domain.friend.dto;

import com.querydsl.core.annotations.QueryProjection;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.UUID;

public class FriendDto {
    @Getter
    @Builder
    public static class FriendRelationRequest{
        private String toUserUuid;

        public FriendRelationRequest(){
        }

        public FriendRelationRequest(String toUserUuid){
            this.toUserUuid = toUserUuid;
        }

    }

    @Getter
    @Builder
    @AllArgsConstructor
    public static class FriendRequest{
        // 친구를 맺고 싶은 친구의 uuid
        private final UUID receiverUuid;
        private final String notifyType;
    }

    @Getter
    public static class FriendListResponse{
        private final UUID friendUuid;
        private final String nickname;
        private final String profile;

        @Builder
        @QueryProjection
        public FriendListResponse(UUID friendUuid, String nickname, String profile){
            this.friendUuid = friendUuid;
            this.nickname = nickname;
            this.profile = profile;
        }
    }
}
