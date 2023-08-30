class Room < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user

    def complete_name
        "#{title}, #{location}"
    end

    validates_presence_of :title, :location, :description
    validates_length_of :title, :location, :description, allow_blank: false

end
