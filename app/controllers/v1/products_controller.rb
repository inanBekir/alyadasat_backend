class V1::ProductsController < ApplicationController
    before_action :authenticate_request!, except: [:index, :show]
    
    def index
        search = params[:term].present? ? params[:term] : nil
        if search
            @product = Product.search(search)
            render json: @product, status: 200
        else
            @product = Product.search "*"
            render json: @product, status: 200
        end
    end

    def create
        @product = current_user.products.create(product_params)

        if @product.save
            render json: @product, status: 201
        else
            render json: @product.errors.messages, status: 422
        end
    end

    def show
        @product = Product.find(params[:id])
        render json: @product, status: 200
    end

    def update
        @product = Product.find(params[:id])

        if @product.update_attributes(product_params)
            render json: @product, status: 200
        else
            render json: {status: "Couldn't update the product"}.to_json, status: 204
        end

    end

    def destroy
        Product.find(params[:id]).destroy
        render json: {status: "Product has been deleted"}.to_json, status: 200
    end

     private
     
     def product_params
        params.permit(:unique_id, :title, :price, :description, :latitude, 
        :longitude, :favori_amount, :is_solid, :is_active, :term)
     end
end
