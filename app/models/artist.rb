class Artist < ApplicationRecord
  has_many :songs,  dependent: :destroy

  validates :first_name, :last_name, :nickname, length: { minimum: 1 }

end
