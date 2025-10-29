class Gig < ApplicationRecord
  include PgSearch::Model

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :title, :contact, :description, :source, :category, presence: true

  pg_search_scope :search_by_details,
    against: {
      title: 'A',
      category: 'B',
      description: 'C'
    },
    using: {
      tsearch: { prefix: true } # allows partial matches, e.g. 'dev' matches 'developer'
    }
end
