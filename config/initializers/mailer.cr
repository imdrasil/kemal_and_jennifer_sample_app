require "carbon"
require "email_opener/carbon_adapter"

MAILER_ADAPTER =
  if ENV["SENDGRID_KEY"]?
    Carbon::SendGridAdapter.new(api_key: ENV["SENDGRID_KEY"])
  else
    EmailOpener::CarbonAdapter.new
  end
