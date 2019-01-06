module Home
  class IndexView < ApplicationView
    model feed_items : Pager::JenniferCollection(Micropost)
  end
end
