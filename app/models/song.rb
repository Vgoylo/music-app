class Song < ApplicationRecord
  self.implicit_order_column = 'title'

  belongs_to :artist
  has_many :downloads, dependent: :destroy

  validates :length, numericality: { greater_than: 5 }
  validates :filesize, numericality: { greater_than: 0 }

end
