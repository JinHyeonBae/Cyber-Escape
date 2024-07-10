
# uuid 타입 변경
ALTER TABLE user ADD COLUMN temp_uuid BINARY(16);
UPDATE user SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE user DROP COLUMN uuid;
ALTER TABLE user CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE room ADD COLUMN temp_uuid BINARY(16);
UPDATE room SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE room DROP COLUMN uuid;
ALTER TABLE room CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE thema ADD COLUMN temp_uuid BINARY(16);
UPDATE thema SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE thema DROP COLUMN uuid;
ALTER TABLE thema CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE furniture ADD COLUMN temp_uuid BINARY(16);
UPDATE furniture SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE furniture DROP COLUMN uuid;
ALTER TABLE furniture CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE game_history ADD COLUMN temp_uuid BINARY(16);
UPDATE game_history SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE game_history DROP COLUMN uuid;
ALTER TABLE game_history CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE friend ADD COLUMN temp_uuid BINARY(16);
UPDATE friend SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE friend DROP COLUMN uuid;
ALTER TABLE friend CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE quiz ADD COLUMN temp_uuid BINARY(16);
UPDATE quiz SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE quiz DROP COLUMN uuid;
ALTER TABLE quiz CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE final_answer ADD COLUMN temp_uuid BINARY(16);
UPDATE final_answer SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE final_answer DROP COLUMN uuid;
ALTER TABLE final_answer CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE ranking ADD COLUMN temp_uuid BINARY(16);
UPDATE ranking SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE ranking DROP COLUMN uuid;
ALTER TABLE ranking CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE my_character ADD COLUMN temp_uuid BINARY(16);
UPDATE my_character SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE my_character DROP COLUMN uuid;
ALTER TABLE my_character CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE character_store ADD COLUMN temp_uuid BINARY(16);
UPDATE character_store SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE character_store DROP COLUMN uuid;
ALTER TABLE character_store CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE chat_room ADD COLUMN temp_uuid BINARY(16);
UPDATE chat_room SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE chat_room DROP COLUMN uuid;
ALTER TABLE chat_room CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE friend_delete_history ADD COLUMN temp_uuid BINARY(16);
UPDATE friend_delete_history SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE friend_delete_history DROP COLUMN uuid;
ALTER TABLE friend_delete_history CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE participants ADD COLUMN temp_uuid BINARY(16);
UPDATE participants SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE participants DROP COLUMN uuid;
ALTER TABLE participants CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE chat_message ADD COLUMN temp_uuid BINARY(16);
UPDATE chat_message SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE chat_message DROP COLUMN uuid;
ALTER TABLE chat_message CHANGE COLUMN temp_uuid uuid BINARY(16);

ALTER TABLE chat_of_room ADD COLUMN temp_uuid BINARY(16);
UPDATE chat_of_room SET temp_uuid = UNHEX(REPLACE(uuid, '-', ''));
ALTER TABLE chat_of_room DROP COLUMN uuid;
ALTER TABLE chat_of_room CHANGE COLUMN temp_uuid uuid BINARY(16);


# uuid set default 변경
ALTER TABLE user ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE room ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE thema ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE furniture ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE game_history ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE friend ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE quiz ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE final_answer ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE ranking ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE my_character ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE character_store ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE chat_room ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE friend_delete_history ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE participants ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE chat_message ALTER COLUMN uuid SET DEFAULT "";
ALTER TABLE chat_of_room ALTER COLUMN uuid SET DEFAULT "";
