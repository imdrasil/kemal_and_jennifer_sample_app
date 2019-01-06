h1 All users
ul.users
  - users.each do |user|
    - render_partial :user, user

== paginate(users, users_path)
