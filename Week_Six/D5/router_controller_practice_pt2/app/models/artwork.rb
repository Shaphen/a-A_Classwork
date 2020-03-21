class Artwork < ApplicationRecord
    validates :artist_id, presence: true, uniqueness: { scope: :title,
        message: "should not have same title" }

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: 'User'

    has_many :shares,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

    has_many :shared_viewers,
    through: :shares,
    source: :viewer

    has_many :comments, 
    dependent: :destroy,
    foreign_key: :artwork_id,
    class_name: 'Comment'

end
