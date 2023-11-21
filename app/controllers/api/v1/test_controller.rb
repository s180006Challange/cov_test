module Api
  module V1
    class TestController < ApplicationController

      def show
        render json: { test: 'ok' }
      end
    end
  end
end
