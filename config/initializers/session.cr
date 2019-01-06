require "./kemal"
require "kemal-session"
require "kemal-session-redis"

Kemal::Session.config do |config|
  config.cookie_name = "sample_app_session"
  config.secret = ENV["SESSION_SECRET"]? || "9b87a08452cebb0f8118ea57a81bd64b0bec7d11d8de691d880343455e628741fd3818b19a87cd9022627685f50ddeee4f485131aeb20317d7e354a077f1c67e"
  config.engine = Kemal::Session::RedisEngine.new(host: "localhost", port: 6379)
end
