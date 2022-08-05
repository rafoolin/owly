-- Auth
INSERT INTO "auth"."users"("id", "created_at", "updated_at", "last_seen", "disabled", "display_name", "avatar_url", "locale", "email", "phone_number", "password_hash", "email_verified", "phone_number_verified", "new_email", "otp_method_last_used", "otp_hash", "otp_hash_expires_at", "default_role", "is_anonymous", "totp_secret", "active_mfa_type", "ticket", "ticket_expires_at", "metadata") VALUES (E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'2022-07-26T19:13:59.007357+00:00', E'2022-07-26T19:14:29.345147+00:00', E'2022-07-26T19:14:29.337+00:00', false, E'test', E'https://s.gravatar.com/avatar/b642b4217b34b1e8d3bd915fc65c4452?r=g&default=blank', E'en', E'test@test.com', null, E'$2a$10$sDl/qAda5IGOePId1x1x6eGSNOyKLs8LSqL//HVO1rC/Hnenfy2pC', false, false, null, null, null, E'2022-07-26T19:13:59.007357+00:00', E'user', false, null, null, E'verifyEmail:2d9edfb6-8777-4a64-9003-af78d2f1b627', E'2022-08-25T19:13:59.002+00:00', '{}');
INSERT INTO "auth"."user_roles"("id", "created_at", "user_id", "role") VALUES (E'6002d947-5157-44e0-9bae-ee8bfe017055', E'2022-07-27T07:33:19.973847+00:00', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'user');
INSERT INTO "auth"."user_roles"("id", "created_at", "user_id", "role") VALUES (E'6002d947-5157-44e0-9bae-ee8bfe017056', E'2022-07-27T07:33:19.973847+00:00', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'me');

-- Task and categories
INSERT INTO "public"."categories"("id", "name", "user_id", "created_at", "update_at", "color") VALUES (E'0d962133-e9a7-471d-97d1-6be986f7803e', E'Category1', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'2022-07-26T19:16:15.969953+00:00', null, 4294961979);
INSERT INTO "public"."categories"("id", "name", "user_id", "created_at", "update_at", "color") VALUES (E'1a38e7ef-ea3c-4d33-baee-68688cb08b13', E'Category2', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'2022-07-26T19:16:31.005614+00:00', null, 4294198070);

-- Category 1
-- Task 1
INSERT INTO "public"."tasks"("id", "user_id", "title", "category_id", "completed", "due_datetime", "completed_at", "created_at", "updated_at", "note", "index_value", "category_color")  VALUES (E'220d23f1-fd8c-45c1-955d-29d17947e0b2', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Task 1', E'0d962133-e9a7-471d-97d1-6be986f7803e', false, now() + interval '2 hours', null, E'2022-07-28T04:40:07.341215+00:00', null, E'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', null, 4294961979);
-- Sub Tasks for Task 1
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'055b3e6f-1d95-427f-ac35-b92d5a69bdac', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 1', E'220d23f1-fd8c-45c1-955d-29d17947e0b2', E'04:48:13.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'100d0bf3-3b79-4f1a-9129-e144f0925cd7', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 2', E'220d23f1-fd8c-45c1-955d-29d17947e0b2', E'05:08:0.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'8df5ac6c-cc78-4c55-87cf-70ae79a5f7fe', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 3', E'220d23f1-fd8c-45c1-955d-29d17947e0b2', E'14:20:13.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'a861a6f5-fcfe-486f-922f-650cf5cc8538', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 4', E'220d23f1-fd8c-45c1-955d-29d17947e0b2', E'20:04:13.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);
-- Task 2 , 3
INSERT INTO "public"."tasks"("id", "user_id", "title", "category_id", "completed", "due_datetime", "completed_at", "created_at", "updated_at", "note", "index_value", "category_color") VALUES (E'e4c2acf9-a52d-4bb1-a3e8-7a6f7e91e129', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Task 2', E'0d962133-e9a7-471d-97d1-6be986f7803e', false, now() + interval '4 hours', null, E'2022-07-28T04:40:07.341215+00:00', null, null, null, 4294961979);
INSERT INTO "public"."tasks"("id", "user_id", "title", "category_id", "completed", "due_datetime", "completed_at", "created_at", "updated_at", "note", "index_value", "category_color") VALUES (E'083218e6-ae5c-4005-b2b9-65d2a0a10004', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Task 3', E'0d962133-e9a7-471d-97d1-6be986f7803e', false, now() - interval '4 hours', null, E'2022-07-28T04:40:07.341215+00:00', null, null, null, 4294961979);
-- Task 5
INSERT INTO "public"."tasks"("id", "user_id", "title", "category_id", "completed", "due_datetime", "completed_at", "created_at", "updated_at", "note", "index_value", "category_color") VALUES (E'0387af86-7a93-4c08-929b-983e5deb79e4', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Task 5', E'0d962133-e9a7-471d-97d1-6be986f7803e', false, now() + interval '5 hours', null, E'2022-07-31T05:36:40.749443+00:00', null, E'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam volutpat commodo sed egestas. Rhoncus mattis rhoncus urna neque viverra justo nec. Sagittis eu volutpat odio facilisis mauris sit amet. Ultrices in iaculis nunc sed augue lacus viverra vitae. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla. Etiam tempor orci eu lobortis elementum nibh tellus molestie. Mollis aliquam ut porttitor leo a diam sollicitudin. Amet nisl purus in mollis nunc. Nunc id cursus metus aliquam. Facilisis leo vel fringilla est ullamcorper eget nulla facilisi etiam. Nec tincidunt praesent semper feugiat nibh sed pulvinar proin.  Sociis natoque penatibus et magnis dis parturient. Turpis egestas sed tempus urna et pharetra pharetra massa. Morbi tincidunt ornare massa eget egestas purus viverra accumsan. Et tortor consequat id porta nibh venenatis cras. Accumsan tortor posuere ac ut consequat semper viverra. Mattis aliquam faucibus purus in massa tempor. Quisque non tellus orci ac auctor augue mauris. Hendrerit gravida rutrum quisque non tellus orci ac auctor. Nisl pretium fusce id velit ut tortor pretium viverra. Diam ut venenatis tellus in metus vulputate eu. Convallis tellus id interdum velit laoreet. Blandit aliquam etiam erat velit. Urna id volutpat lacus laoreet non curabitur gravida arcu.  Consectetur libero id faucibus nisl tincidunt eget. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu. Pellentesque nec nam aliquam sem et tortor consequat. Nullam vehicula ipsum a arcu. Volutpat odio facilisis mauris sit. Lacinia at quis risus sed. Morbi blandit cursus risus at. Etiam dignissim diam quis enim. Facilisi cras fermentum odio eu. Aliquam sem et tortor consequat. Ornare arcu dui vivamus arcu felis bibendum ut tristique et. Felis eget nunc lobortis mattis. Molestie at elementum eu facilisis sed odio morbi. Malesuada fames ac turpis egestas integer eget aliquet. Orci nulla pellentesque dignissim enim sit amet venenatis. Tempus egestas sed sed risus pretium quam vulputate dignissim.  Lectus magna fringilla urna porttitor rhoncus dolor. Viverra ipsum nunc aliquet bibendum. Tortor posuere ac ut consequat semper viverra nam. Elementum nibh tellus molestie nunc. Ipsum consequat nisl vel pretium lectus quam id leo. Commodo sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Amet consectetur adipiscing elit pellentesque habitant. Laoreet non curabitur gravida arcu ac. Suspendisse ultrices gravida dictum fusce. Arcu non sodales neque sodales ut etiam sit amet. Nibh sit amet commodo nulla facilisi nullam vehicula ipsum. Aliquam ut porttitor leo a. Tristique senectus et netus et malesuada.  Lacinia at quis risus sed vulputate odio ut enim blandit. Leo urna molestie at elementum eu facilisis sed odio. Diam sit amet nisl suscipit. Viverra orci sagittis eu volutpat odio facilisis. Sit amet risus nullam eget felis eget. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Morbi non arcu risus quis varius. Adipiscing bibendum est ultricies integer quis auctor. Vulputate ut pharetra sit amet aliquam id. A iaculis at erat pellentesque adipiscing commodo elit at imperdiet. Sit amet dictum sit amet justo donec enim diam vulputate. Ultricies mi quis hendrerit dolor magna eget est lorem. Gravida neque convallis a cras semper auctor neque.  Elementum pulvinar etiam non quam lacus. Dui accumsan sit amet nulla. Dapibus ultrices in iaculis nunc. Adipiscing elit duis tristique sollicitudin. Tincidunt tortor aliquam nulla facilisi cras fermentum odio. Leo vel orci porta non. Feugiat in ante metus dictum at tempor commodo ullamcorper a. Molestie at elementum eu facilisis sed odio morbi quis. Accumsan tortor posuere ac ut consequat semper. Vestibulum lectus mauris ultrices eros in cursus turpis massa. Lobortis feugiat vivamus at augue eget arcu dictum varius.  Euismod elementum nisi quis eleifend quam adipiscing vitae proin. Vulputate sapien nec sagittis aliquam malesuada bibendum. Ullamcorper morbi tincidunt ornare massa eget egestas. Morbi tristique senectus et netus et malesuada fames ac turpis. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula. In egestas erat imperdiet sed euismod nisi. Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Lectus urna duis convallis convallis tellus id interdum velit. Fermentum dui faucibus in ornare. Mi ipsum faucibus vitae aliquet nec ullamcorper sit. Ut lectus arcu bibendum at varius vel pharetra. Lacus luctus accumsan tortor posuere ac ut consequat. Amet est placerat in egestas erat imperdiet sed euismod. Gravida dictum fusce ut placerat orci nulla.  Habitant morbi tristique senectus et netus et malesuada. Magna sit amet purus gravida quis blandit turpis cursus. Non curabitur gravida arcu ac tortor dignissim convallis aenean. Non blandit massa enim nec. Enim facilisis gravida neque convallis. Quis imperdiet massa tincidunt nunc. In hac habitasse platea dictumst quisque sagittis purus. Enim nulla aliquet porttitor lacus luctus. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Ut venenatis tellus in metus vulputate eu scelerisque. Nibh venenatis cras sed felis eget velit aliquet sagittis id. Id velit ut tortor pretium viverra suspendisse potenti nullam.  Et ultrices neque ornare aenean euismod elementum. Non quam lacus suspendisse faucibus interdum posuere. Molestie ac feugiat sed lectus. Sodales ut etiam sit amet. Porttitor massa id neque aliquam vestibulum morbi blandit cursus risus. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis. Odio aenean sed adipiscing diam donec adipiscing. Congue mauris rhoncus aenean vel elit scelerisque mauris. Placerat vestibulum lectus mauris ultrices eros in cursus. Ac orci phasellus egestas tellus.  Vulputate ut pharetra sit amet aliquam id diam maecenas ultricies. Purus non enim praesent elementum. Semper eget duis at tellus at urna condimentum. Condimentum lacinia quis vel eros donec ac odio tempor. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. Fermentum odio eu feugiat pretium nibh ipsum. Nisl rhoncus mattis rhoncus urna neque viverra justo. Sapien eget mi proin sed libero. Commodo odio aenean sed adipiscing. Risus feugiat in ante metus dictum at tempor commodo ullamcorper. Amet commodo nulla facilisi nullam.', null, 4294961979);
-- Category 2
-- Task 1
INSERT INTO "public"."tasks"("id", "user_id", "title", "category_id", "completed", "due_datetime", "completed_at", "created_at", "updated_at", "note", "index_value", "category_color") VALUES (E'94c90ead-fed4-4324-8723-d08c8eda6c08', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Task 1', E'1a38e7ef-ea3c-4d33-baee-68688cb08b13', false, now() - interval '5 hours', null, E'2022-07-28T04:45:25.261619+00:00', null, null, null, 4294198070);
-- Task 2
INSERT INTO "public"."tasks"("id", "user_id", "title", "category_id", "completed", "due_datetime", "completed_at", "created_at", "updated_at", "note", "index_value", "category_color") VALUES (E'18a8d768-7455-45d1-b960-fc0101fef8ae', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Task 2', E'1a38e7ef-ea3c-4d33-baee-68688cb08b13', false, now() + interval '4 hours', null, E'2022-07-28T04:45:25.261619+00:00', null, null, null, 4294198070);
-- Sub Tasks for Task 1
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'072c876c-6265-4e88-83e8-6d34230f8962', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 1', E'18a8d768-7455-45d1-b960-fc0101fef8ae', E'04:48:13.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'14afab7d-49f0-48b9-92a8-65b614c2230f', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 2', E'18a8d768-7455-45d1-b960-fc0101fef8ae', E'14:38:33.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);
INSERT INTO "public"."sub_tasks"("id", "user_id", "title", "task_id", "due_at", "completed", "created_at", "updated_at", "note", "index_value") VALUES (E'175a6267-088a-4e2d-9877-86f16baabb1e', E'5a83f60f-ae07-4722-a138-834c9882b6ad', E'Sub Task 3', E'18a8d768-7455-45d1-b960-fc0101fef8ae', E'20:20:33.00809', false, E'2022-07-28T04:48:13.00809+00:00', null, null, null);