require "./initializers/**"

require "form_object"
require "http_method_emulator"
require "flash_container"

# Application code
require "../src/models/application_record"
require "../src/models/**"

require "../src/mailers/application_mailer.cr"
require "../src/mailers/**"

require "../src/form_objects/**"

require "../src/views/application_view"
require "../src/views/**"

require "../src/controllers/application_controller"
require "../src/controllers/*"

# Add handlers that should run before your application
add_handler HTTPMethodEmulator::Handler::INSTANCE

serve_static({ "gzip" => true, "dir_listing" => false })
