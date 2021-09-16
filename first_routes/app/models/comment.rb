# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  body              :string           not null
#  user_id           :integer          not null
#  artwork_id        :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Comment < ApplicationRecord
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User,
        dependent: :destroy

    belongs_to :artwork, 
        foreign_key: :artwork_id, 
        class_name: :Artwork,
        dependent: :destroy

    belongs_to :parent_comment, 
        foreign_key: :parent_comment_id, 
        class_name: :Comment,
        optional: true

    has_many :replies, 
        foreign_key: :parent_comment_id, 
        class_name: :Comment
end
