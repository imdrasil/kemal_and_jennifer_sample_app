class Micropost < ApplicationRecord
  with_timestamps

  mapping(
    id: Primary32,
    content: { type: String, default: "" },
    picture: String?,
    user_id: Int32?,
    created_at: Time?,
    updated_at: Time?,
  )

  scope :ordered { order(created_at: :desc) }

  belongs_to :user, User
end
