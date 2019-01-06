- build_form :unfollow, relationship_path(user.id), method: :delete do
  == csrf_tag
  button.btn type="submit" Unfollow
