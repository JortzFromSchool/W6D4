# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :views,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :views,
        source: :viewer


    has_many :comments, 
        foreign_key: :artwork_id, 
        class_name: :Comment,
        dependent: :destroy

    has_many :users_commented, 
        through: :comments, 
        source: :user
end
