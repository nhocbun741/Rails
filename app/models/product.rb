class Product < ApplicationRecord
    # enumerize
    extend Enumerize
    enumerize :level, in: [:easy, :medium, :hard], default: :easy
    enumerize :country, in: ISO3166::Country.translations, default: :DE

    # valides
    validates :title, :description, :price, presence: true

    validate :title_is_shorter_than_description
    

    def title_is_shorter_than_description
        return if title.blank? || description.blank?
        if description.length < title.length
            errors.add(:description,'can\'t be shorter than title' )
        end
    end

    # validate :price_is_number_and_always_present_and_more_than_0

    # def price_is_number_and_always_present_and_more_than_0
    #     if price <= 0 and price.present?
    #         errors.add(:price,'cant\t be smaller than 0 and price is a number')
    #     end
    # end

    # scope
    scope :published, -> {where(published: true)}
    scope :priced_more_than, -> (price) {where('price > ?',price)}
    scope :description_include, ->(description){where('description LIKE ? ',"%#{description}%")}

    # ActiveRecord life cycle hook
    before_save :strip_html_from_description, :set_title_lowercase

    def strip_html_from_description
        self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
    end

    def set_title_lowercase
        self.title = title.downcase!
    end

    #one to many
    belongs_to :category

end

