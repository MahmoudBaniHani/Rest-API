require 'httparty'
class CategoriesController < ApplicationController
  def index
    @category = Category.all
    # @reponse = HTTParty.get("http://localhost:3000/api/v1/categories", headers: {'Accept': 'application/json'})
    # render json: @reponse
  end

  def show
    @category = Category.find(params[:id])
    @reponse = HTTParty.get("http://localhost:3000/api/v1/categories", headers: {'Accept': 'application/json'})
    render json: @reponse
  end

  def new
  end

  def edit
  end
  def create
    reponse = HTTParty.post("http://localhost:3000/api/v1/categories", headers: {'Accept': 'application/json'},data: category_params)
    render json: reponse
  end
  def update
    render json: {status:'success',message:'hello',data: @category}
  end

  private
  def category_params
    params[:name]
  end
end
