class ProductsController < ActionController::Base
    def index
        @search = params[:search]
        @products = if @search.present?
            Product.where("name LIKE ?", "%#{@search}%")
        else
            Product.all
        end 
        @products = Product.all.page(params[:page]).per(10)
    end

    def new
        @product = Product.new
    end

    def create 
        @product = Product.new(product_params)

        if @product.save

            redirect_to action: :index
            return
        end

        
        render :new
    end


    def edit 
        @product = Product.find(params[:id])
    end

    def update 
        @product = Product.find(params[:id])
        
        if @product.update(product_params)

            redirect_to action: :index
            return
        end

        
        render :new
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy

        redirect_to action: :index
    end

    private

    def product_params
        params.require(:product).permit(:sku, :name, :image, :price, :stock)
    end
end
