class UsersController < ApplicationController
  BASE = "/users"

  before_get BASE, &method(:ensure_login)
  get BASE, &method(:index)

  get BASE + "/new", &method(:new)

  before_get BASE + "/:id", &method(:ensure_login)
  get BASE + "/:id", &method(:show)

  post BASE, &method(:create)

  before_get BASE + "/:id/edit", &method(:ensure_login)
  get BASE + "/:id/edit", &method(:edit)

  before_patch BASE + "/:id", &method(:ensure_login)
  patch BASE + "/:id", &method(:update)

  before_delete BASE + "/:id", &method(:ensure_login)
  before_delete BASE + "/:id", &method(:ensure_admin)
  delete BASE + "/:id", &method(:destroy)

  before_get BASE + "/:id/following", &method(:ensure_login)
  get BASE + "/:id/following", &method(:following)

  before_get BASE + "/:id/followers", &method(:ensure_login)
  get BASE + "/:id/followers", &method(:followers)

  def index
    users = User.all.where { _activated }.paginate(page)
    page(Users::IndexView, users)
  end

  def new
    user = NewUserForm.new(User.new)
    page(Users::NewView, user)
  end

  def show
    user = User.find!(params.url["id"])
    unless user.activated?
      redirect_to root_path
      return
    end
    microposts = user.microposts_query.paginate(page)
    page(Users::ShowView, user, microposts)
  end

  def create
    user = NewUserForm.new(User.new)
    if user.verify(request) && user.save
      flash["success"] = t("create.success")
      redirect_to root_path
    else
      flash["danger"] = t("create.danger")
      page(Users::NewView, user)
    end
  end

  def edit
    user = User.find!(params.url["id"])
    unless current_user?(user)
      redirect_to root_path
      return
    end
    form = UpdateUserForm.new(user)
    page(Users::EditView, user, form)
  end

  def update
    user = User.find!(params.url["id"])
    unless current_user?(user)
      redirect_to root_path
      return
    end
    form = UpdateUserForm.new(user)
    if form.verify(request) && form.save
      flash["success"] = t("update.success")
      redirect_to root_path
    else
      page(Users::EditView, user, form)
    end
  end

  def destroy
    User.find!(params.url["id"]).destroy
    flash["success"] = t("destroy.success")
    redirect_to users_path
  end

  def following
    @page_title = t("following.title")
    this_user = User.find!(params.url["id"])
    users = this_user.following_query.paginate(page)
    page(Users::FollowView, this_user, users)
  end

  def followers
    @page_title = title = t("followers.title")
    this_user = User.find!(params.url["id"])
    users = this_user.followers_query.paginate(page)
    page(Users::FollowView, this_user, users)
  end

  def ensure_admin
    redirect_to root_path unless current_user!.admin?
  end
end
