class HomeController < ApplicationController
  get "/", &method(:index)
  get "/about", &method(:about)

  def index
    page(Home::IndexView, feed_items)
  end

  def about
    page(Home::AboutView)
  end

  private def feed_items
    if signed_in?
      current_user!.feed_query.paginate(page)
    else
      Pager::JenniferCollection(Micropost).empty
    end
  end
end
