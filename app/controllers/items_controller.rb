class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    2.times {@item.stations.build}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: '物件を登録しました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:age,:address,:remark,stations_attributes: [:name,:line,:distance,:item_id,:_destroy])
  end

  def update_item_params
    params.require(:item).permit(:name,:price,:age,:address,:remark,stations_attributes: [:name,:line,:distance,:item_id,:_destroy])
  end
end
