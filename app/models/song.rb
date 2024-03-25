class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads, dependent: :destroy

  validates :length, numericality: { greater_than: 5 }
  validates :filesize, numericality: { greater_than: 0 }
  
  scope :top, ->(period, count) { joins(
        <<-SQL.squish
          JOIN (
            SELECT COUNT(*) as downloads_count, song_id FROM downloads
            WHERE downloads.created_at > '#{period.ago}' GROUP BY song_id) AS downloads
            ON songs.id = downloads.song_id
        SQL
    ).order('downloads_count DESC').limit(count) }
end
