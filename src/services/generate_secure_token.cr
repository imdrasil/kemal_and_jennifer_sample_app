class GenerateSecureToken
  def self.call
    token = new_token
    {
      plain: token,
      digest: digest(token)
    }
  end

  def self.digest(token)
    Crypto::Bcrypt::Password.create(token).to_s
  end

  def self.new_token
    generator.urlsafe_base64
  end

  def self.generator
    Random::DEFAULT
  end
end
