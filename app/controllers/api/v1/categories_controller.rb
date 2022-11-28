module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category , only: [:show,:edit,:update,:destroy]
      def index
        # category = Category.order('created_at ASC')
        # category = Category.searchByid
        # category = Category.searchByname
        # category = Category.orderCreateatdesc
        # category = Category.orderCreateatasc
        # category = Category.name_no_duplicate
        # category = Category.groupByname
        category = Category.all
        render json: {status:'SUCCESS',message:'Loaded category',data:category},status: :ok
      end
      def show
        render json: {status:'success',message:'hello',location: @category} ,status: :ok
      end

      def create
        puts "This is the param", params["name"]
        category = Category.create(name: params["name"])
        if category.save
          render json: {status:'success',message:'Saved Category',data: category} ,status: :ok
        else
          render json: {status:'Error',message:'Cannot save category',data: category.errors} ,status: :unprocessable_entity
        end
      end
      def destroy
        @category.destroy
        render json: {status:'success',message:'Deleted Category',data: @category} ,status: :ok
      end
      def update
        if @category.update(name:category_params)
          render json: {status:'success',message:'Updated Category',data: @category} ,status: :ok
        else
          render json: {status:'Error',message:'Cannot updated category',data: @category.errors} ,status: :unprocessable_entity
        end
      end
      private
      def set_category
        @category = Category.find(params[:id])
      end
      def category_params
        # params[:name]
        params[:name]
      end
    end


  end
end