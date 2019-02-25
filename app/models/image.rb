class Image < ApplicationRecord
    default_scope { order(:position) }
    validates :headline, :url_image, :article, presence: true
    belongs_to :article
    def increase_like
        self.increament!(:count_like)
    end
end