module SharedPartials
  include ViewModel::Helpers

  def_partial :error_messages, errors

  def_partial :feed, feed_items

  def_partial :micropost_form

  def_partial :micropost, micropost

  def_partial :stats

  def_partial :user_info
end
