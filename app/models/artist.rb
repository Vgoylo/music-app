class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name, length: { minimum: 2 }

  scope :top, ->(letter, count) { where("name like '#{letter}%'").limit(count) }

end
