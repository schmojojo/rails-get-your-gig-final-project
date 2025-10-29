class Gig < ApplicationRecord
  include PgSearch::Model

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :title, :contact, :description, :source, :category, presence: true

  pg_search_scope :search_by_details,
    against: {
      title: 'A',        # highest weight
      category: 'B',     # medium
      description: 'C'   # lowest
    },
    using: {
      tsearch: { prefix: true },     # partial word match
      trigram: { threshold: 0.2 }    # fuzzy matching (for typos)
    }
end
