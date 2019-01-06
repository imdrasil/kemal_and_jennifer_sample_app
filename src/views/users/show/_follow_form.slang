- unless current_user?(user)
  #follow_form
    - if current_user!.following?(user)
      - render_partial :unfollow, user
    - else
      - render_partial :follow, user
