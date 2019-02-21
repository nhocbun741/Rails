class ProductsController < ApplicationController
    def index
        @products = Product.includes(:category).published
    end
    def show
        @product = Product.find(params[:id]) 
    end
    def new
        @product = Product.new(title: "Ruby")
        @categories = Category.all 
    end
        
end
