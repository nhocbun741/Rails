class Text < ApplicationRecord
    validates :headline, :sentence, presence: true
    belongs_to :article
    def return_sentence
        return sentence
    end
end