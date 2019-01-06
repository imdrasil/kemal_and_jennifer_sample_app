.row
  aside.col-md-4
    section
      h1
        img src=user.avatar_path
        = user.name
    section.stats
      - render_partial :stats
  .col-md-8
    - if signed_in?
      - render_partial :follow_form, user
    - if microposts.any?
      h3 Microposts #{microposts.size}
      ol.microposts
        - microposts.each do |micropost|
          - render_partial :micropost, micropost
        == paginate(microposts, user_path(user.id))
