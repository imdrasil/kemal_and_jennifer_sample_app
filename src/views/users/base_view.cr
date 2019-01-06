module Users
  abstract class BaseView < ApplicationView
    def_partial :user, user
  end
end
