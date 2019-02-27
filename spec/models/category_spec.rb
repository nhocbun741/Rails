require 'rails_helper'

RSpec.describe Category, type: :model do
    context "Association" do
        # it "Category has many products" do
        #     assc = described_class.reflect_on_association(:products)
        #     expect(assc.macro).to eq :has_many  
        # end
        it {should have_many(:products)}
    end
end
