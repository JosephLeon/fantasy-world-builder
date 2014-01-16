class UniversesController < ApplicationController

  def index
    @universe = Universe.all
  end

  def show
    @universe = Universe.find(params[:id])
    @characters = @universe.characters
    @areas = @universe.areas
    @areas_as_city = @areas.where(type: "City")
  end

  def new
    @universe = Universe.new
  end

  def create
    @universe = Universe.new(character_params)
    if @universe.save
      redirect_to @universe
    else
      render 'new'
    end
  end

  def edit
    @universe = Universe.find(params[:id])
  end

  def update
    @universe = Universe.find(params[:id])
    @universe.update_attributes(character_params)
    redirect_to :action => 'show', :id => @universe
  end

  def destroy
    @universe = Universe.find(params[:id])
    @universe.destroy
    redirect_to action: :index
  end

  private

    def character_params
      params.require(:universe).permit(:name,
        :description,
        :special_rules,
        :pantheon)
    end
end
