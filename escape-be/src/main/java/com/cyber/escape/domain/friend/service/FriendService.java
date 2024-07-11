package com.cyber.escape.domain.friend.service;

import com.cyber.escape.domain.auth.util.UuidUtil;
import com.cyber.escape.domain.friend.dto.FriendDto;
import com.cyber.escape.domain.friend.entity.Friend;
import com.cyber.escape.domain.friend.repository.FriendRepository;
import com.cyber.escape.domain.friend.repository.FriendRepositoryImpl;
import com.cyber.escape.domain.notification.document.Notify;
import com.cyber.escape.domain.notification.service.NotificationService;
import com.cyber.escape.domain.rank.dto.RankingDto;
import com.cyber.escape.domain.user.entity.User;
import com.cyber.escape.domain.user.repository.UserRepository;
import com.cyber.escape.domain.user.util.UserUtil;
import com.cyber.escape.global.common.util.IdFinder;
import com.cyber.escape.global.exception.ExceptionCodeSet;
import com.cyber.escape.global.exception.FriendException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.*;

@Service
@Slf4j
public class FriendService {
    private final UserRepository userRepository;
    private final FriendRepository friendRepository;
    private final NotificationService notificationService;
    private final UserUtil userUtil;

    private final IdFinder idFinder;

    public FriendService(UserRepository userRepository, FriendRepository friendRepository, NotificationService notificationService, UserUtil userUtil, IdFinder idFinder) {
        this.userRepository = userRepository;
        this.friendRepository = friendRepository;
        this.notificationService = notificationService;
        this.userUtil = userUtil;
        this.idFinder = idFinder;
    }

    public void makeFriend(FriendDto.FriendRelationRequest dto){
        UUID currentUserUuid = userUtil.getLoginUserUuid();

        if(dto.getToUserUuid().equals(currentUserUuid))
            throw new FriendException(ExceptionCodeSet.NO_SELF_FRIEND);

        log.info("친구 추가하려는 유저의 uuid : {}", dto.getToUserUuid());
        User senderInfo = userRepository.findUserByUuid(currentUserUuid)
                .orElseThrow(() -> new FriendException(ExceptionCodeSet.ENTITY_NOT_EXISTS));

        UUID receiverUuid = UuidUtil.stringToUUID(dto.getToUserUuid());
        User receiverInfo = userRepository.findUserByUuid(receiverUuid)

                .orElseThrow(() -> new FriendException(ExceptionCodeSet.ENTITY_NOT_EXISTS));

        Optional<Friend> friend = friendRepository.getFriend(currentUserUuid, receiverUuid);
        // 이미 친구 관계라면
        if(friend.isPresent()){
            throw new FriendException(ExceptionCodeSet.ALREADY_FRIEND);
        }

        Friend sender = Friend
                        .builder()
                        .sender(senderInfo)
                        .receiver(receiverInfo)
                        .build();
        Friend receiver = Friend
                        .builder()
                        .sender(receiverInfo)
                        .receiver(senderInfo)
                        .build();

        friendRepository.save(sender);
        friendRepository.save(receiver);
    }

    public String sendToRequest(FriendDto.FriendRequest req){

        notificationService.send(req.getReceiverUuid(), null, Notify.NotificationType.FRIEND, "친구 요청입니다.");

        return "";
    }

    public List<FriendDto.FriendListResponse> getMyFriendList(int pageNumber){
        UUID userUuid = userUtil.getLoginUserUuid();
        //Long userId = idFinder.findIdByUuid(userUuid, User.class);

        List<FriendDto.FriendListResponse> friendListPerPages = new ArrayList<>();

        int pageSize = 10;
        int startIndex = (pageNumber - 1) * pageSize;

        List<FriendDto.FriendListResponse> friendList = friendRepository.findFriendList(userUuid);

        int endIndex = Math.min(startIndex + pageSize, friendList.size());

        for (int i = startIndex; i < endIndex; i++) {
            friendListPerPages.add(friendList.get(i));
        }

        return friendListPerPages;
    }

    public String removeFriend(Map<String, String> req){
//        Long currentUserId = idFinder.findIdByUuid(userUtil.getLoginUserUuid(), User.class);
//        Long friendId = idFinder.findIdByUuid(req.get("friendUuid"), User.class);

        UUID curUuid = userUtil.getLoginUserUuid();
        UUID freindUuid = UuidUtil.stringToUUID(req.get("friendUuid"));

        friendRepository.removeFriendAndInsertLogHistory(curUuid, freindUuid);

        return "";
    }
}
