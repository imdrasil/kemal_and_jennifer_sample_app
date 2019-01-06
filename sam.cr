require "./config/initializers/database"
require "./src/models/*"
require "./db/migrations/*"
require "sam"

load_dependencies "jennifer"

# NOTE: it is very important to load custom tasks after others are loaded
require "./db/seed"

# Jennifer::Config.configure do |conf|
#   conf.logger = Logger.new(STDOUT)
#   conf.logger.level = Logger::ERROR
# end

Sam.help
