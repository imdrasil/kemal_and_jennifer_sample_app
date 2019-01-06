require "../controllers/concerns/router_helper"
require "../controllers/concerns/session_helper"
require "./shared_partials"

abstract class ApplicationView < ViewModel::Base
  include RouterHelper
  include SessionHelper
  include SharedPartials
  include Pager::ViewHelper

  getter page_title : String, flash : FlashContainer, current_user : User?

  def initialize(@flash, @current_user, page_title = nil)
    @page_title = page_title || I18n.translate("application_view.title")
  end

  def_partial :footer

  def_partial :navigation

  def csrf_tag
    ""
  end

  def csrf_token
    ""
  end

  def pluralize(count, word)
    if count > 1
      "#{count} #{Inflector.pluralize(word)}"
    else
      "#{count} #{word}"
    end
  end

  private def t(key, *args, **opts)
    I18n.translate("#{self.class.to_s.underscore}.#{key}", *args, **opts)
  end

  private def l(*args)
    I18n.localize(*args)
  end
end
