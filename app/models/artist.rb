class Artist < ApplicationRecord
  has_many :songs, -> { order(title: :asc) }, dependent: :destroy

  validates :name, length: { minimum: 2 }

  scope :top, ->(letter, count) {
    select('artists.*, SUM(downloads.downloads_count) as songs_downloads')
    .joins(
      <<-SQL.squish
        JOIN songs ON artists.id = songs.artist_id
        JOIN (
          SELECT COUNT(*) as downloads_count, song_id FROM downloads
          GROUP BY song_id
        ) AS downloads ON songs.id = downloads.song_id
      SQL
    )
    .where("name like :letter", letter: "#{letter}%").group(:id)
    .order('songs_downloads DESC').limit(count)
    }

  def songs_top
    songs.joins(
      <<-SQL.squish
        JOIN (
          SELECT COUNT(*) as downloads_count, song_id FROM downloads
          GROUP BY song_id
        ) AS downloads ON songs.id = downloads.song_id
      SQL
    ).order('downloads.downloads_count DESC')
  end
end
