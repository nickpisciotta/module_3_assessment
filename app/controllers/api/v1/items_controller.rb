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
  end
end
