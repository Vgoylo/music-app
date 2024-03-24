class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name, length: { minimum: 2 }

  scope :top, ->(letter, count) {
    select('artists.*, SUM(downloads.downloads_count) as songs_downloads')
    .joins("INNER JOIN songs ON artists.id = songs.artist_id
          INNER JOIN (SELECT COUNT(*) as downloads_count, song_id FROM downloads GROUP BY song_id) as downloads
          ON songs.id = downloads.song_id")
    .where("lower(name) like '#{letter}%'").group(:name)
    .order('downloads.downloads_count DESC').limit(count)
    }

  def songs_top
    songs.joins("INNER JOIN (SELECT COUNT(*) as downloads_count, song_id FROM downloads
    GROUP BY song_id) as downloads ON songs.id = downloads.song_id")
    .order('downloads.downloads_count DESC')
  end
end
