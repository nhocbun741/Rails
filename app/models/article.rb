class Article < ApplicationRecord
    validates :title, presence: true
    def return_text_image
        
    end
    
    def isPublished
        return if created_at.blank?
        if Time.now > created_at
            return true
        end
    end
    
    #one to many
    has_many :texts
    has_many :images
end
