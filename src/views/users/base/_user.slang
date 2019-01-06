li
  img src=user.avatar_path
  a href="#{user_path(user.id)}"
    = user.name
  - if current_user!.admin? && !current_user?(user)
    == link_to destroy_user_path(user.id), "(delete)", { "data-confirm" => "You sure?" }, :delete
