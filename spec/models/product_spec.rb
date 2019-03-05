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
        let!(:product){create(:product, description: '<p>test</p>', title: 'test ABC' )}
        let!(:build_product){build(:product, description: 'abc')}
        it 'Strips HTML from description' do
            expect(product.description).to eq('test')
        end
    
        it "Makes title lowercase" do
           expect(product.title).to eq('test abc') 
        end
    
        it 'Title is shorter than description' do
            build_product.validate
            expect(build_product.errors.messages).to include(description: ['can\'t be shorter than title'])
        end
    end
end
