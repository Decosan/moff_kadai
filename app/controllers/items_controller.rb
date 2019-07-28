class ItemsController < ApplicationController
  before_action :set_params, only:[:show,:edit,:update,:destroy]

  def index
    @items = Item.all
  end

  def show
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
    if @item.update(item_params)
      redirect_to items_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name,:price,:age,:address,:remark,stations_attributes: [:name,:line,:distance,:id,:_destroy])
  end
end
