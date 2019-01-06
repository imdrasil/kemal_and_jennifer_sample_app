class Relationship < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    follower_id: Int32,
    followed_id: Int32,
    created_at: Time?,
    updated_at: Time?,
  )

  belongs_to :follower, User
  belongs_to :followed, User
end
