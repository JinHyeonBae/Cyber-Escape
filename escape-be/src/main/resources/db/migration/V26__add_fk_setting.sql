-- room 테이블의 FK 제약 조건 설정
ALTER TABLE room ADD CONSTRAINT FK_user_to_room FOREIGN KEY (user_id) REFERENCES user(uuid);
ALTER TABLE room ADD CONSTRAINT FK_thema_to_room FOREIGN KEY (thema_id) REFERENCES thema(uuid);

-- game_history 테이블의 FK 제약 조건 설정
ALTER TABLE game_history ADD CONSTRAINT FK_user_to_game_history FOREIGN KEY (user_id) REFERENCES user(uuid);
ALTER TABLE game_history ADD CONSTRAINT FK_thema_to_game_history FOREIGN KEY (thema_id) REFERENCES thema(uuid);

-- friend 테이블의 FK 제약 조건 설정
ALTER TABLE friend ADD CONSTRAINT FK_from_user_to_friend FOREIGN KEY (from_user_id) REFERENCES user(uuid);
ALTER TABLE friend ADD CONSTRAINT FK_to_user_to_friend FOREIGN KEY (to_user_id) REFERENCES user(uuid);

-- quiz 테이블의 FK 제약 조건 설정
ALTER TABLE quiz ADD CONSTRAINT FK_thema_to_quiz FOREIGN KEY (thema_id) REFERENCES thema(uuid);

-- ranking 테이블의 FK 제약 조건 설정
ALTER TABLE ranking ADD CONSTRAINT FK_thema_to_ranking FOREIGN KEY (thema_id) REFERENCES thema(uuid);
ALTER TABLE ranking ADD CONSTRAINT FK_user_to_ranking FOREIGN KEY (user_id) REFERENCES user(uuid);

-- my_character 테이블의 FK 제약 조건 설정
ALTER TABLE my_character ADD CONSTRAINT FK_user_to_my_character FOREIGN KEY (user_id) REFERENCES user(uuid);
ALTER TABLE my_character ADD CONSTRAINT FK_character_to_my_character FOREIGN KEY (character_id) REFERENCES character_store(uuid);

-- friend_delete_history 테이블의 FK 제약 조건 설정
ALTER TABLE friend_delete_history ADD CONSTRAINT FK_from_user_to_friend_delete_history FOREIGN KEY (from_user_id) REFERENCES user(uuid);
ALTER TABLE friend_delete_history ADD CONSTRAINT FK_to_user_to_friend_delete_history FOREIGN KEY (to_user_id) REFERENCES user(uuid);

-- participants 테이블의 FK 제약 조건 설정
ALTER TABLE participants ADD CONSTRAINT FK_chat_room_to_participants FOREIGN KEY (chat_room_id) REFERENCES chat_room(uuid);
ALTER TABLE participants ADD CONSTRAINT FK_user_to_participants FOREIGN KEY (user_id) REFERENCES user(uuid);
ALTER TABLE participants ADD CONSTRAINT FK_updated_user_to_participants FOREIGN KEY (updated_user) REFERENCES user(uuid);

-- chat_message 테이블의 FK 제약 조건 설정
ALTER TABLE chat_message ADD CONSTRAINT FK_chat_room_to_chat_message FOREIGN KEY (chat_room_id) REFERENCES chat_room(uuid);
ALTER TABLE chat_message ADD CONSTRAINT FK_sender_to_chat_message FOREIGN KEY (sender_id) REFERENCES user(uuid);

-- chat_of_room 테이블의 FK 제약 조건 설정
ALTER TABLE chat_of_room ADD CONSTRAINT FK_room_to_chat_of_room FOREIGN KEY (room_id) REFERENCES room(uuid);
ALTER TABLE chat_of_room ADD CONSTRAINT FK_chat_room_to_chat_of_room FOREIGN KEY (chat_room_id) REFERENCES chat_room(uuid);
