require "kemal"
require "../config/config"

class Settings
  class_property host : String = "127.0.0.1", port = 3000
end

VERSION = "0.1.0"

Kemal.run
