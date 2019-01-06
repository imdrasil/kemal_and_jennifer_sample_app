require "./base_view"

module Users
  class FollowView < BaseView
    model this_user : User, users : Pager::JenniferCollection(User)

    def current_path
      following_user_path(this_user.id)
    end
  end
end
