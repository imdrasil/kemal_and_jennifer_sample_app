- user = micropost.user!
li id="micropost-#{micropost.id}"
  == link_to user_path(user.id) do
    img src=user.avatar_path
  span.user
    == link_to user_path(user.id), user.name
  span.content
    = micropost.content
  span.timestamp
    | Posted at #{l(micropost.created_at!)}.
    - if current_user?(user)
      == link_to destroy_micropost_path(micropost.id), "delete", { "class" => "btn btn-danger xs" }, :delete
