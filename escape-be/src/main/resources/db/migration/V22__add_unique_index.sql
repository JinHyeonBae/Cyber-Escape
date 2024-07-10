-- user 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE user ADD UNIQUE INDEX unique_uuid_user (uuid);

-- room 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE room ADD UNIQUE INDEX unique_uuid_room (uuid);

-- thema 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE thema ADD UNIQUE INDEX unique_uuid_thema (uuid);

-- furniture 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE furniture ADD UNIQUE INDEX unique_uuid_furniture (uuid);

-- game_history 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE game_history ADD UNIQUE INDEX unique_uuid_game_history (uuid);

-- friend 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE friend ADD UNIQUE INDEX unique_uuid_friend (uuid);

-- quiz 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE quiz ADD UNIQUE INDEX unique_uuid_quiz (uuid);

-- final_answer 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE final_answer ADD UNIQUE INDEX unique_uuid_final_answer (uuid);

-- ranking 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE ranking ADD UNIQUE INDEX unique_uuid_ranking (uuid);

-- my_character 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE my_character ADD UNIQUE INDEX unique_uuid_my_character (uuid);

-- character_store 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE character_store ADD UNIQUE INDEX unique_uuid_character_store (uuid);

-- chat_room 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE chat_room ADD UNIQUE INDEX unique_uuid_chat_room (uuid);

-- friend_delete_history 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE friend_delete_history ADD UNIQUE INDEX unique_uuid_friend_delete_history (uuid);

-- participants 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE participants ADD UNIQUE INDEX unique_uuid_participants (uuid);

-- chat_message 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE chat_message ADD UNIQUE INDEX unique_uuid_chat_message (uuid);

-- chat_of_room 테이블의 uuid 컬럼에 UNIQUE 인덱스 추가
ALTER TABLE chat_of_room ADD UNIQUE INDEX unique_uuid_chat_of_room (uuid);
