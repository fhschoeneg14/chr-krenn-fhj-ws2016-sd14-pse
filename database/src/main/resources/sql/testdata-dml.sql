# select correct database
USE pse;

#user
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `created`, `modified`) VALUES (NULL, 'student1', 'edfd3e005a2da55ee99bb4b49afa33c6fa1bc945d93db54f5cba483355462acefdfd77ce1602449c9365d4eafb342e210ed0d33df4ceed40b92fa515bab5f89d', 'CRzTaAbyUxxEUs56', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `created`, `modified`) VALUES (NULL, 'student2', '6378ce16c796bee6b162f7370914e290cc8debac1548d29d1939934ad76177b37f4bb6b54bd8bcf6855ad7c36f35025a8b158e39d3e284c0c72f17765200e974', 'TJIaMD0HUR1uUiLx', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `created`, `modified`) VALUES (NULL, 'student3', '7230e34d69b2ede090042643840fb5581d6f5342925b0c592010899a11d56a3b82ceaca581d32d773d14718be4d5436719dc475bb66949895e0835e389aa0323', 'StLTK5akHsvhm84K', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `created`, `modified`) VALUES (NULL, 'student4', 'b64b5d1e09e3587fdfdebb3dbef2c6d31e79fa96233542a99071787b591e5f2d814ca44231d1362115c1ebc95930068a9fc6b5f6609c623ea049ca2e7bb8ee15', 'uEXAJ6Dhh28iNG6n', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `created`, `modified`) VALUES (NULL, 'student5', '59de5ccb6b7f9865794ad60d25e1858e77abf565c0fb58dea64b041fda7aeaedaeb6cd314691902a257b00d149537c754effaa97ac17ed30a488db22444c8f2e', 'HszDgIvOkTCeBT1W', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `created`, `modified`) VALUES (NULL, 'admin1'  , 'edfd3e005a2da55ee99bb4b49afa33c6fa1bc945d93db54f5cba483355462acefdfd77ce1602449c9365d4eafb342e210ed0d33df4ceed40b92fa515bab5f89d', 'CRzTaAbyUxxEUs56', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


#person
INSERT INTO `pse`.`person` (`id`, `address`, `firstname`, `imageurl`, `lastname`, `place`, `department_id`, `status_name`, `user_id`) VALUES (NULL, 'teststraße 1', 'Typ', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRxOXdV15ruEqhPAJJ5cMxWFBIqLexBFQIMLYWQ8aTjxFFjxnGBKuUOwCU', 'Test', 'Graz', '1', 'Online', '1');
INSERT INTO `pse`.`person` (`id`, `address`, `firstname`, `imageurl`, `lastname`, `place`, `department_id`, `status_name`, `user_id`) VALUES (NULL, 'teststraße 2', 'Max', 'https://i.ytimg.com/vi/S4UG_l-CHF4/maxresdefault.jpg', 'Mustermann', 'Wien', '2', 'Abwesend', '2');

#user_roles
INSERT INTO `user_roles` (`username`, `role`, `roleGroup`) VALUES ('student1', 'user', 'Roles');
INSERT INTO `user_roles` (`username`, `role`, `roleGroup`) VALUES ('student2', 'user', 'Roles');
INSERT INTO `user_roles` (`username`, `role`, `roleGroup`) VALUES ('student3', 'user', 'Roles');
INSERT INTO `user_roles` (`username`, `role`, `roleGroup`) VALUES ('student4', 'user', 'Roles');
INSERT INTO `user_roles` (`username`, `role`, `roleGroup`) VALUES ('student5', 'user', 'Roles');
INSERT INTO `user_roles` (`username`, `role`, `roleGroup`) VALUES ('admin1'  , 'admin', 'Roles');

#news
INSERT INTO news (title, message, author_id, activation, termination)
VALUES ('News 1', 'Short News Message', 1, CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY));
INSERT INTO news (title, message, author_id, activation, termination)
VALUES ('News 2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis a',
        1, CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY));
INSERT INTO news (title, message, author_id, activation, termination)
VALUES ('News 3', 'Short News Message', 1, CURRENT_TIMESTAMP, NULL);
INSERT INTO news (title, message, author_id, activation, termination)
VALUES ('News 4', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis a',
        1, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY), DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY));

#test communities
INSERT INTO `community` (`id`, `name`, `public`, `author_id`, `created`, `modified`) VALUES ('1', 'test1', true, 'student1', NULL, NULL);
INSERT INTO `community` (`id`, `name`, `public`, `author_id`, `created`, `modified`) VALUES ('2', 'test2', true, 'student2', NULL, NULL);
INSERT INTO `community` (`id`, `name`, `public`, `author_id`, `created`, `modified`) VALUES ('3', 'test3', true, 'student3', NULL, NULL);
INSERT INTO `community` (`id`, `name`, `public`, `author_id`, `created`, `modified`) VALUES ('4', 'test4', true, 'student4', NULL, NULL);
        
COMMIT;