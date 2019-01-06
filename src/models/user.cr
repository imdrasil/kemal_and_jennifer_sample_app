require "jennifer/model/authentication"

class User < ApplicationRecord
  with_timestamps

  mapping(
    id: Primary32,
    name: { type: String, default: "" },
    email: { type: String, default: "" },
    password_digest: { type: String, default: "" },
    admin: { type: Bool, default: false},
    activation_digest: String?,
    activated: { type: Bool, default: false },
    activated_at: Time?,
    reset_digest: String?,
    reset_sent_at: Time?,

    created_at: Time?,
    updated_at: Time?,
  )

  has_many :microposts, Micropost, dependent: :destroy
  has_many :active_relationships, Relationship, foreign: :follower_id, dependent: :destroy
  has_many :passive_relationships, Relationship, foreign: :followed_id, dependent: :destroy

  @followings : Array(User)?

  # NOTE: `through` relations aren't supported from the box but can be simulated next way

  def following
    @followings ||= following_query.to_a
  end

  def followers
    @followers ||= followers_query.to_a
  end

  def following_query
    User.all.relation(:passive_relationships).where { _relationships__follower_id == id }
  end

  def followers_query
    User.all.relation(:active_relationships).where { _relationships__followed_id == id }
  end

  def feed_query
    Micropost.all
      .eager_load(:user)
      .join(Relationship) { (_followed_id == User._id) & (_follower_id == id) }
      .ordered
  end

  def avatar_path
    "/images/profile.png"
  end

  {% for method in %i(activation reset) %}
    {% method = method.id %}
    def {{method}}_valid?(token : String)
      return false if {{method}}_digest.nil?
      Crypto::Bcrypt::Password.new({{method}}_digest.not_nil!) == token
    end
  {% end %}

  def password_reset_expired?
    reset_sent_at.nil? || reset_sent_at! < 2.hours.ago
  end

  def follow(other_user)
    add_active_relationships({ :followed_id => other_user.id })
  end

  def unfollow(other_user)
    active_relationships_query.where { _followed_id == other_user.id }.destroy
  end

  def following?(user)
    if @followings
      following.includes?(user)
    else
      following_query.where { _relationships__followed_id == user.id }.exists?
    end
  end

  def authenticate(given_password)
    self if Crypto::Bcrypt::Password.new(password_digest) == given_password
  end
end
