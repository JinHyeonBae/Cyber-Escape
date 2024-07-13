-- room 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE room SET tmp_user_id = user_id, tmp_thema_id = thema_id;

-- game_history 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE game_history SET tmp_user_id = user_id, tmp_thema_id = thema_id;

-- friend 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE friend SET tmp_from_user_id = from_user_id, tmp_to_user_id = to_user_id;

-- quiz 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE quiz SET tmp_thema_id = thema_id;

-- ranking 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE ranking SET tmp_thema_id = thema_id, tmp_user_id = user_id;

-- my_character 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE my_character SET tmp_user_id = user_id, tmp_character_id = character_id;

-- friend_delete_history 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE friend_delete_history SET tmp_from_user_id = from_user_id, tmp_to_user_id = to_user_id;

-- participants 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE participants SET tmp_chat_room_id = chat_room_id, tmp_user_id = user_id, tmp_updated_user = updated_user;

-- chat_message 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE chat_message SET tmp_chat_room_id = chat_room_id, tmp_sender_id = sender_id;

-- chat_of_room 테이블의 기존 컬럼 값을 임시 컬럼으로 복사
UPDATE chat_of_room SET tmp_room_id = room_id, tmp_chat_room_id = chat_room_id;
