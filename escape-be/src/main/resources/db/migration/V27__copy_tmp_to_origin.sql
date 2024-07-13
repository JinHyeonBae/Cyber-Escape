-- room 테이블의 임시 컬럼 값을 기존 컬럼으로 복사

UPDATE room r
JOIN thema t ON CONV(r.tmp_thema_id, 16, 10) = t.id
JOIN user u ON CONV(r.tmp_user_id, 16, 10) = u.id
SET r.thema_id = t.uuid,
    r.user_id = u.uuid;

-- game_history 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE game_history SET user_id = tmp_user_id, thema_id = tmp_thema_id;

UPDATE game_history gh
JOIN thema t ON CONV(gh.tmp_thema_id, 16, 10) = t.id
JOIN user u ON CONV(gh.tmp_user_id, 16, 10) = u.id
SET gh.thema_id = t.uuid,
    gh.user_id = u.uuid;

-- friend 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE friend SET from_user_id = tmp_from_user_id, to_user_id = tmp_to_user_id;

-- quiz 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE quiz SET thema_id = tmp_thema_id;

UPDATE quiz q
JOIN thema t ON CONV(q.tmp_thema_id, 16, 10) = t.id
SET q.thema_id = t.uuid;

-- ranking 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE ranking SET thema_id = tmp_thema_id, user_id = tmp_user_id;

UPDATE ranking r
JOIN thema t ON CONV(r.tmp_thema_id, 16, 10) = t.id
JOIN user u ON CONV(r.tmp_user_id, 16, 10) = u.id
SET r.thema_id = t.uuid,
    r.user_id = u.uuid;

-- my_character 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE my_character SET user_id = tmp_user_id, character_id = tmp_character_id;


-- friend_delete_history 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE friend_delete_history SET from_user_id = tmp_from_user_id, to_user_id = tmp_to_user_id;


-- participants 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE participants SET chat_room_id = tmp_chat_room_id, user_id = tmp_user_id, updated_user = tmp_updated_user;

-- chat_message 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE chat_message SET chat_room_id = tmp_chat_room_id, sender_id = tmp_sender_id;

-- chat_of_room 테이블의 임시 컬럼 값을 기존 컬럼으로 복사
-- UPDATE chat_of_room SET room_id = tmp_room_id, chat_room_id = tmp_chat_room_id;
