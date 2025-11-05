class Bookmark < ApplicationRecord
  belongs_to :gig
  belongs_to :user

  validates :user_id, uniqueness: { scope: :gig_id}
end
