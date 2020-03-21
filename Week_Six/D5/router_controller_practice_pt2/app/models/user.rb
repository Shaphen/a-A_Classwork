class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
    foreign_key: :artist_id,
    class_name: 'Artwork'

    has_many :views,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare'
    
    has_many :shared_artworks,
    through: :views,
    source: :artwork

    has_many :comments,
    foreign_key: :user_id,
    class_name: 'Comment'
    
end
