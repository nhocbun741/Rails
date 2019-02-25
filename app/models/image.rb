class Image < ApplicationRecord
    validates :headline, :url_image ,presence: true
    belongs_to :article
    def return_images
        return url_image
    end 
end