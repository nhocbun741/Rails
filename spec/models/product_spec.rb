require 'rails_helper'
RSpec.describe Product, type: :model do
    context "validate" do
        # it 'validates the presence of title' do
        #     product = Product.new(title: '')
        #     product.validate
        #     expect(product.errors.messages).to include(title: ["can't be blank"])  
        # end
        it { should validate_presence_of(:title) }
    end

    context "Association" do
        # it 'Product belongs to category' do
        #     assc = described_class.reflect_on_association(:category)
        #     expect(assc.macro).to eq :belongs_to
        # end
        it {should belong_to(:category)}
    end
    
    context "Logic method" do
        it 'Strips HTML from description' do
            product = Product.new(description: 'ruby on rails')
            expect(product.strip_html_from_description).to eq('ruby on rails')
        end
    
        it "Makes title lowercase" do
           product = Product.new(title: 'ABC')
           expect(product.set_title_lowercase()).to eq('abc') 
        end
    
        it 'Title is shorter than description' do
            product = Product.new(title: 'ruby', description: 'ru')
            expect(product.title_is_shorter_than_description()).to eq(['can\'t be shorter than title'])
        end
    end
end
