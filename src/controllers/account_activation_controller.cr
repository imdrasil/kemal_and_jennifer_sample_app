require "../services/activate_user"

class AccountActivationController < ApplicationController
  BASE = "/account_activation"

  get "#{BASE}/:id/edit", &method(:edit)

  def edit
    user = User.where { _email == params.query["email"] }.first
    if user && ActivateUser.call(user, params.url["id"])
      log_in user
      flash["success"] = t("edit.success")
      redirect_to user_path(user.id)
    else
      flash["danger"] = t("edit.danger")
      redirect_to root_path
    end
  end
end
