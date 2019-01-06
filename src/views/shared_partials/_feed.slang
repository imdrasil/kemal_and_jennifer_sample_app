- if feed_items.any?
  ol.microposts
    - feed_items.each do |micropost|
      - render_partial :micropost, micropost
  == paginate(feed_items, root_path)