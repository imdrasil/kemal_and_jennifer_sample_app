class HTTP::Server::Context
  property controller : KemalController?
  @flash : FlashContainer?

  def flash
    @flash ||= FlashContainer.from_session(session.string?(FlashContainer.key))
  end
end

abstract class KemalController
  getter context : HTTP::Server::Context

  delegate :session, :params, :flash, :request, to: context

  def initialize(@context)
  end

  def self.instance(env : HTTP::Server::Context)
    {% begin %}
    if env.controller.nil?
      env.controller = self.new(env)
    end
    env.controller.as(self)
    {% end %}
  end

  def redirect_to(url)
    context.redirect(url)
  end

  macro method(m)
    -> (env : HTTP::Server::Context) do
      self.instance(env).{{m.id}}
    end
  end
end
