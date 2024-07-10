
# 기존 FK 삭제
ALTER TABLE participants DROP FOREIGN KEY FK_chat_room_TO_participants;
ALTER TABLE chat_message DROP FOREIGN KEY FK_chat_room_TO_chat_message;
ALTER TABLE room DROP FOREIGN KEY FK_thema_TO_room_1;
ALTER TABLE room DROP FOREIGN KEY FK_user_TO_room_1;
ALTER TABLE game_history DROP FOREIGN KEY FK_user_TO_game_history_1;
ALTER TABLE game_history DROP FOREIGN KEY FK_thema_TO_game_history_1;
ALTER TABLE friend DROP FOREIGN KEY FK_user_TO_friend_1;
ALTER TABLE friend DROP FOREIGN KEY FK_user_TO_friend_2;
ALTER TABLE quiz DROP FOREIGN KEY FK_thema_TO_quiz_1;
ALTER TABLE ranking DROP FOREIGN KEY FK_thema_TO_ranking_1;
ALTER TABLE ranking DROP FOREIGN KEY FK_user_TO_ranking_1;
ALTER TABLE my_character DROP FOREIGN KEY FK_user_TO_my_character_1;
ALTER TABLE my_character DROP FOREIGN KEY FK_character_store_TO_my_character_1;
ALTER TABLE friend_delete_history DROP FOREIGN KEY FK_user_TO_friend_delete_history_1;
ALTER TABLE friend_delete_history DROP FOREIGN KEY FK_user_TO_friend_delete_history_2;
ALTER TABLE participants DROP FOREIGN KEY FK_user_TO_participants_1;
ALTER TABLE participants DROP FOREIGN KEY FK_user_TO_participants_2;
ALTER TABLE chat_message DROP FOREIGN KEY FK_user_TO_chat_message_1;
ALTER TABLE chat_of_room DROP FOREIGN KEY FK_room_TO_chat_of_room_1;
ALTER TABLE chat_of_room DROP FOREIGN KEY FK_chat_room_TO_chat_of_room_1;
