class Gig < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :title, :contact, :description, :source, :category, presence: true
end
