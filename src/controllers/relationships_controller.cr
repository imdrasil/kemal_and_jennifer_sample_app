class RelationshipsController < ApplicationController
  BASE = "/relationships"

  before_post BASE, &method(:ensure_login)
  post BASE, &method(:create)

  before_delete BASE + "/:id", &method(:ensure_login)
  delete BASE + "/:id", &method(:destroy)

  def create
    user = User.find!(params.body["follow[followed_id]"])
    current_user!.follow(user)
    redirect_to user_path(user.id)
  end

  def destroy
    user = User.find!(params.url["id"])
    current_user!.unfollow(user)
    redirect_to user_path(user.id)
  end
end
