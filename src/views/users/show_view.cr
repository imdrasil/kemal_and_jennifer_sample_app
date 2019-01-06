module Users
  class ShowView < ApplicationView
    model user : User, microposts : Pager::JenniferCollection(Micropost)

    def initialize(@user, @microposts, *args)
      super(*args)
      @page_title = @user.name
    end

    def_partial :follow_form, user

    def_partial :follow, user

    def_partial :unfollow, user
  end
end
