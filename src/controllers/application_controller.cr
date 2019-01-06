require "./concerns/*"

abstract class ApplicationController < KemalController
  include ViewModel
  include RouterHelper
  include SessionHelper

  @page_title : String? = nil
  property current_user : User?
  @current_user_loaded = false

  after_all do |env|
    env.session.string(FlashContainer.key, env.flash.to_session)
  end

  macro page(klass, *args)
    {{klass}}.new({{args.splat}}{% if args.size > 0 %},{% end %} flash, current_user, @page_title).render
  end

  def current_user
    return @current_user if @current_user_loaded
    @current_user = if user_id = session.string?("user_id")
      User.find(user_id)
    end
  end

  private def redirect_back
    redirect_to request.headers["Referer"]? || root_path
  end

  private def log_in(user)
    session.string("user_id", user.id.to_s)
  end

  def ensure_login
    return if signed_in?
    flash["info"] = t("ensure_login")
    redirect_to sign_in_path
  end

  private def page
    (params.query["page"]? || 0).to_i
  end

  private def t(key, *args, **opts)
    I18n.translate("#{self.class.to_s.underscore}.#{key}", *args, **opts)
  end
end
