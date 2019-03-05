require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
    let!(:products) {create_list(:product,2)}
    describe "#index" do
         
        it "gets a list of products" do
            #products = []
            #category = Category.create!(title: 'OK')
            #     products << Product.create!(title: 'ruby1', description: 'ruby on rails 1',category: category, price: 11)
            #     products << Product.create!(title: 'ruby2', description: 'ruby on rails 2',category: category, price: 12)
                
            #     get :index
            #     expect(assigns(@products).size).to eq products.size  
            
            #products = create_list(:product, 2)
            
            # binding.pry
            
            get :index
            expect(assigns(:products).size).to eq products.size  
            expect(response).to render_template :index
        end
    end

    describe "#show" do
        let!(:product) {create(:product)} 
        
        it "show detail product" do
            get :show, params:{ id: product.id}
            expect(assigns(:product)).to eq product
        end
        
        it "render template #show" do
            get :show, params: { id: product.id }
            # expect(get "products/show/#{product.id}").to eq product.id => false
            expect(response).to render_template :show
        end
    end
    
    describe "#new" do
        it "render template #new" do
            get :new
            expect(response).to render_template :new
        end 
    end

    describe "#create" do
        let!(:product){build(:product)}
        it "create new product" do
            post :create, params: {product: product.attributes}
            expect(assigns(:product)).to eq(Product.last)
        end

        it "redirect to /products when created" do
            post :create, params: {product: product.attributes}
            expect(response).to redirect_to("/products")
        end

        it "create faild" do
            product.title = ''
            post :create, params: {product: product.attributes}
            expect(response).to render_template :new  
        end
        
               
    end

    describe "#edit" do
        let!(:product){create(:product)}
        it "render template edit" do
            get :edit, params: {id: product.id}
            expect(response).to render_template :new
        end
    end

    describe "#update" do
        let!(:product){create(:product)}
        it "redirect to /products when updated" do
            put :update, params: {id: product.id, product: product.attributes}
            expect(response).to redirect_to "/products"
        end
        
        it "update faild" do
            product.title = ''
            put :update, params: {id: product.id, product: product.attributes}
            expect(response).to render_template :new
        end
        
    end


    describe "#delete" do
        let!(:product){create(:product)}
        it "Delete product success" do
            expect{delete :destroy, params: {id: product.id}}.to change(Product, :count).by(-1)
        end
        
        it "redirect to index when deleted" do
            delete :destroy, params: {id: product.id}
            expect(response).to redirect_to("/products")
        end
        
    end
end
