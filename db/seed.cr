require "json"

class PostSeed
  JSON.mapping(
    content: String
  )

  def create(user_id)
    Micropost.new.tap do |post|
      post.user_id = user_id
      post.content = content
    end.save!
  end
end

class UserSeed
  JSON.mapping(
    email: String,
    name: String,
    admin: { type: Bool, default: false },
    activated: { type: Bool, default: true },
    posts: { type: Array(PostSeed), default: [] of PostSeed },
    followers: { type: Array(String), default: [] of String }
  )

  getter id : Int32?

  def password
    "123"
  end

  def activation_token
    "Asd"
  end

  def create
    return if User.where { _email == email }.exists?
    user = build_user
    user.save!
    @id = user.id
  end

  def create_relations
    return if id.nil? || followers.empty?
    user = User.where { _email == email }.first!
    others = User.where { _email.in(followers) }
    others.each do |other|
      Relationship.create!({follower_id: user.id, followed_id: other.id})
    end
  end

  def create_posts
    return if id.nil?
    posts.each(&.create(id))
  end

  def self.create_list(users)
    users.each(&.create)
    users.each(&.create_posts)
    users.each(&.create_relations)
  end

  private def build_user
    User.new.tap do |user|
      user.email = email
      user.name = name
      user.admin = admin
      user.password_digest = Crypto::Bcrypt::Password.create(password, cost: Crypto::Bcrypt::DEFAULT_COST).to_s
      user.activation_digest = Crypto::Bcrypt::Password.create(activation_token).to_s
      user.activated = activated
      user.activated_at = 1.day.ago
    end
  end
end

Sam.namespace "db" do
  task "seed" do
    users = Array(UserSeed).from_json(File.read(File.join(__DIR__, "seeds", "users.json")))
    UserSeed.create_list(users)
  end
end
