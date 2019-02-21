class ProductsController < ApplicationController
    before_action :product_params, only: [:create, :update]
    before_action :find_product, only: [:show, :edit, :update,:destroy]
    ### action index
    def index
        @products = Product.includes(:category).published
    end
    def show
    
    ### action new
    end
    def new
        @product = Product.new
    end

    ### action create
    def create
        @product =Product.new(product_params)
        unless @product.save
            flash.now[:notice] = messageFail(:create)
            return render :new
        end
        redirect_to products_path, notice: messageSuccess(:create)
    end

    ### action edit
    def edit      
        render :new
    end

    ### action update
    def update
        unless @product.update(product_params)
            flash.now[:notice] = messageFail(:create)
            return render :new
        end
        redirect_to products_path, notice: messageSuccess(:update)
    end

    ### action destroy
    def destroy
        message = messageFail(:destroy)
        message = messageSuccess(:destroy) if @product.destroy
        redirect_to products_path, notice: message
    end

    private

    ### product_params
    def product_params
        params.require(:product).permit(:title, :description, :price, :published, :category,:level, :country)
    end

    ### find_product
    def find_product
        @product = Product.find(params[:id])
    end

    ### message success
    def messageSuccess(action)
        "You have successfully #{action} the product"
    end

    ### message fail
    def messageFail(action)
        "There is an error when #{action}"    
    end  
end
