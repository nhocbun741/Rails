class ProductsController < ApplicationController
    def index
        @products = Product.includes(:category).published
    end
    def show
        @product = Product.find(params[:id]) 
    end
    def new
        @product = Product.new
    end
    def create
        product_params = params.require(:product).permit(:title, :description, :price, :published, :category, :level, :country)
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path
        end
            render :new
    end
    
end
