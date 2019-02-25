class Article < ApplicationRecord
    validates :title, presence: true
    # def isPublished
    #     return if created_at.blank?
    #     if Time.now > created_at
    #         return true
    #     end
    # end
    def published?
        created_at < Time.now
    end
    
    
    def increase_like
        self.increament!(:count_like)
    end
    
    #one to many
    has_many :texts
    has_many :images
end
