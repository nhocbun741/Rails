require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
    describe "#index" do
        it "gets a list of products" do
            products = []
            #category = Category.create!(title: 'OK')
            #     products << Product.create!(title: 'ruby1', description: 'ruby on rails 1',category: category, price: 11)
            #     products << Product.create!(title: 'ruby2', description: 'ruby on rails 2',category: category, price: 12)
                
            #     get :index
            #     expect(assigns(@products).size).to eq products.size  
            
      
            products = create_list(:product, 2)
            get :index
            expect(assigns(:products).size).to eq products.size  
        end
    end
end
