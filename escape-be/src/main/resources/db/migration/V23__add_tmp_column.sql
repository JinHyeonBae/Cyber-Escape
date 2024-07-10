-- room 테이블에 임시 컬럼 추가
ALTER TABLE room ADD COLUMN tmp_user_id BINARY(16);
ALTER TABLE room ADD COLUMN tmp_thema_id BINARY(16);

-- game_history 테이블에 임시 컬럼 추가
ALTER TABLE game_history ADD COLUMN tmp_user_id BINARY(16);
ALTER TABLE game_history ADD COLUMN tmp_thema_id BINARY(16);

-- friend 테이블에 임시 컬럼 추가
ALTER TABLE friend ADD COLUMN tmp_from_user_id BINARY(16);
ALTER TABLE friend ADD COLUMN tmp_to_user_id BINARY(16);

-- quiz 테이블에 임시 컬럼 추가
ALTER TABLE quiz ADD COLUMN tmp_thema_id BINARY(16);

-- ranking 테이블에 임시 컬럼 추가
ALTER TABLE ranking ADD COLUMN tmp_thema_id BINARY(16);
ALTER TABLE ranking ADD COLUMN tmp_user_id BINARY(16);

-- my_character 테이블에 임시 컬럼 추가
ALTER TABLE my_character ADD COLUMN tmp_user_id BINARY(16);
ALTER TABLE my_character ADD COLUMN tmp_character_id BINARY(16);

-- friend_delete_history 테이블에 임시 컬럼 추가
ALTER TABLE friend_delete_history ADD COLUMN tmp_from_user_id BINARY(16);
ALTER TABLE friend_delete_history ADD COLUMN tmp_to_user_id BINARY(16);

-- participants 테이블에 임시 컬럼 추가
ALTER TABLE participants ADD COLUMN tmp_chat_room_id BINARY(16);
ALTER TABLE participants ADD COLUMN tmp_user_id BINARY(16);
ALTER TABLE participants ADD COLUMN tmp_updated_user BINARY(16);

-- chat_message 테이블에 임시 컬럼 추가
ALTER TABLE chat_message ADD COLUMN tmp_chat_room_id BINARY(16);
ALTER TABLE chat_message ADD COLUMN tmp_sender_id BINARY(16);

-- chat_of_room 테이블에 임시 컬럼 추가
ALTER TABLE chat_of_room ADD COLUMN tmp_room_id BINARY(16);
ALTER TABLE chat_of_room ADD COLUMN tmp_chat_room_id BINARY(16);
