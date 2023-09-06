class Room < ApplicationRecord
    mount_uploader :picture, PictureUploader
    extend FriendlyId

    has_many :reviews, dependent: :destroy
    belongs_to :user

    validates_presence_of :title
    validates_presence_of :slug
    friendly_id :title, use: [:slugged, :history]
    
    def complete_name
        "#{title}, #{location}"
    end

    scope :most_recent, -> {order(created_at: :desc)}

    validates_presence_of :title, :location, :description
    validates_length_of :title, :location, :description, allow_blank: false

    def self.search(query)
        if query.present?
            where(['location ILIKE :query OR title ILIKE :query OR description ILIKE :query', query: "%#{query}%"])
        
        end
    end
end
