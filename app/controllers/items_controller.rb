class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @character = @item.character
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to :action => 'show', :id => @item
  end

  def destroy
    @item = Item.find(params[:id])
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
