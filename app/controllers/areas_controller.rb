class AreasController < ApplicationController
  def index
    @area = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @universe = @area.universe
    @characters = @area.characters
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to @area
    else
      render 'new'
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    @area.update_attributes(area_params)
    redirect_to :action => 'show', :id => @area
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    redirect_to action: :index
  end

  private
    def area_params
      params.require(:area).permit(:name,
        :description,
        :map,
        :notes,
        :universe_id,
        :environment
        )
    end
end
