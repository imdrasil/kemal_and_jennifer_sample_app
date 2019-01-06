- if signed_in?
  .row
    aside.col-md-4
      section.user_info
        - render_partial :user_info
      section.stats
        - render_partial :stats
      section.microposts_form
        - render_partial :micropost_form
    .col-md-8
      h3 Micropost Feed
      - render_partial :feed, feed_items
- else
  .center.jumborton
    h1 Welcome to the Sample App
    h2
      | This is the home page for the Jennifer + Kemal sample application.
    a.btn.btn-lg.btn-primary href=sign_up_path
      | Sign up now!
  a href="https://crystal-lang.org/"
    img src="#{image_path("crystal_logo.png")}" alt="Crystal logo" height="80" width="80"