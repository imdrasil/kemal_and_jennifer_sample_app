require "./base_view"

module Users
  class IndexView < BaseView
    model users : Pager::JenniferCollection(User)
  end
end
