class CitiesController < ApplicationController
  def index
    @city = City.all
  end

  def show
    @city = City.find(params[:id])
    @universe = @city.universe
    @characters = @city.characters
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to @city
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update_attributes(city_params)
    redirect_to :action => 'show', :id => @city
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to action: :index
  end

  private
    def city_params
      params.require(:city).permit(:name,
        :description,
        :map,
        :notes,
        :population,
        :economy,
        :building_style,
        :resources
        )
    end
end
