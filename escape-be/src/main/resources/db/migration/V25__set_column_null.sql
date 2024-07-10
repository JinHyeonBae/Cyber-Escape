-- room 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE room SET user_id = NULL, thema_id = NULL;

-- game_history 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE game_history SET user_id = NULL, thema_id = NULL;

-- friend 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE friend SET from_user_id = NULL, to_user_id = NULL;

-- quiz 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE quiz SET thema_id = NULL;

-- ranking 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE ranking SET thema_id = NULL, user_id = NULL;

-- my_character 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE my_character SET user_id = NULL, character_id = NULL;

-- friend_delete_history 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE friend_delete_history SET from_user_id = NULL, to_user_id = NULL;

-- participants 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE participants SET chat_room_id = NULL, user_id = NULL, updated_user = NULL;

-- chat_message 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE chat_message SET chat_room_id = NULL, sender_id = NULL;

-- chat_of_room 테이블의 기존 컬럼 값을 NULL로 설정
UPDATE chat_of_room SET room_id = NULL, chat_room_id = NULL;
