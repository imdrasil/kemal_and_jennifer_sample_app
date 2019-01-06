abstract class ApplicationMailer < Carbon::Email
  getter email_subject : String, email_address : String

  from Carbon::Address.new("Sample App", "noreply@sample-app.com")
  to email_address
  subject email_subject
  settings.adapter = MAILER_ADAPTER

  def initialize
    @email_address = ""
    @email_subject = ""
  end

  macro html_template
    def html_body
      Kilt.render "#{__DIR__}/templates/{{@type.name.underscore}}/html.slang"
    end
  end
end
