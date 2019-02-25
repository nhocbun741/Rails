class Text < ApplicationRecord
    default_scope { order(:position) }
    validates :headline, :sentence, :article, presence: true
    belongs_to :article
    def increase_like
        self.increament!(:count_like)
    end
end