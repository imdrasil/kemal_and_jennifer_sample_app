abstract class BaseService
  def self.call(*args)
    new(*args).call
  end

  abstract def call
end
