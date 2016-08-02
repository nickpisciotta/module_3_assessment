class Api::V1::ItemsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    render :json => Item.all
  end

  def show
    render :json => Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head :no_content
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      render json: {@item, status: 201}
    end
  end


  private
    def item_params
      params.permit(:name, :description, :image_url)
    end

end
