- _current_user = current_user!
.stats
  a href="#{following_user_path(_current_user.id)}"
    strong#following.stat = _current_user.following_query.count
    | following
  a href="#{followers_user_path(_current_user.id)}"
    strong#followers.stat = _current_user.followers_query.count
    | followers
