module Api
  module V1
    class GirlsController < ApplicationController
      def index
        rankers = Girl.order(created_at: :desc)
        render json: rankers.map { |girl| girl.as_json(only: [:name, :age, :reserved_rate])}
      end

      def rankers
        girls = Girl.order(reserved_rate: :desc).first(3)
        render json: girls.map { |girl| girl.as_json(only: [:name, :age, :reserved_rate])}
      end

      def show
        girl = Girl.find_by(id: params[:id])

         render json: girl.as_json(only: [:name, :age, :reserved_rate])
      end

      def create
        girl = Girl.new(create_params)

        if girl.save
          render json: { 
            message: '作成しました', 
           }
        else
          render json: { 
            message: '失敗しました', 
           }
        end
      end

      private

      def create_params
        params.permit(:name, :age, :reserved_rate)
      end
    end
  end
end