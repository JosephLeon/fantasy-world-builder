class ItemsController < ApplicationController
  def new
    @items = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @items = Item.find(params[:id])
  end

  def create
    @items = Item.new(item_params)
    if @items.save
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
end
