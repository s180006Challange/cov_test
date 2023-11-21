module Api
  module V1
    class ProductsController < ApplicationController

      def show
        render json: Product.find(params[:id]).as_json
      end
    end
  end
end
