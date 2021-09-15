# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.new(username: 'thuggerthugger')
user2 = User.new(username: 'Yeezy')
user3 = User.new(username: 'cincectaples')

user1.save!
user2.save!
user3.save!

artwork1 = Artwork.new(title: 'Millions', img_url: 'www.google.com', artist_id: user1.id)
artwork2 = Artwork.new(title: 'Donda', img_url: 'www.bing.com', artist_id: user2.id)
artwork3 = Artwork.new(title: 'Vince Staples', img_url: 'www.duckduckgo.com', artist_id: user3.id)

artwork1.save!
artwork2.save!
artwork3.save!

as1 = ArtworkShare.new(artwork_id: artwork1.id, viewer_id: user2.id)
as2 = ArtworkShare.new(artwork_id: artwork2.id, viewer_id: user1.id)
as3 = ArtworkShare.new(artwork_id: artwork1.id, viewer_id: user3.id)

as1.save!
as2.save!
as3.save!