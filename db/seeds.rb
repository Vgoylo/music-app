# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

100.times do |t|
  Artist.create(
    name: "#{SecureRandom.alphanumeric(10)}"
  )
end

puts 'Artist have been created'

#
Artist.all.each do |artist|
  50.times do |t|
    song = Song.create!(
      title: "#{SecureRandom.alphanumeric(5)} --- #{artist.id}",
      length: rand(6..20),
      filesize: rand(3..15),
      artist_id: artist.id
    )

    50.times do |t|
      Download.create!(
        song: song,
        created_at: rand(Time.at(2.months.ago)..Time.at(Time.now))
      )
    end
  end
end

puts 'Songs have been created'
puts 'Download have been created'