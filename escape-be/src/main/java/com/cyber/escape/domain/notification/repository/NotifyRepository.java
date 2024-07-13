package com.cyber.escape.domain.notification.repository;


import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.cyber.escape.domain.notification.document.Notify;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface NotifyRepository extends MongoRepository<Notify, String> {

    List<Notify> findByReceiverUuidAndIsReadOrderByCreatedAt(UUID receiverUuid, char isRead);
    List<Notify> findBySenderUuidAndReceiverUuidAndNotificationTypeAndIsRead(UUID senderUuid, UUID receiverUuid, Notify.NotificationType notificationType, char isRead);
    List<Notify> findBySenderUuidAndReceiverUuidAndRoomUuidAndIsRead(UUID senderUuid, UUID receiverUuid, UUID roomUuid, char isRead);
    Optional<Notify> findById(ObjectId id);

    //Notify findBySenderUuidAndReceiverUuidAndRoomUuidAndIsRead(String senderUuid, String receiverUuid, Notify.NotificationType notificationType);
}

