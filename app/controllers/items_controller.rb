class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def edit
    @item = @item.find(params[:id])
  end

  def update
    @item = @item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to :action => 'show', :id => @item
  end

  def destroy
    @item = @item.find(params[:id])
    @item.destroy
    redirect_to action: :index
  end

  private
    def item_params
      params.require(:item).permit(:name,
        :appearance,
        :weight,
        :size,
        :damage,
        :durability,
        :powers,
        :notes,
        :character_id,
        :monster_id,
        :area_id)
    end
end
