class UniversesController < ApplicationController

  def index
    @universe = Universe.all
  end

  def show
    @universe = Universe.find(params[:id])
    @characters = @universe.characters
    @areas = @universe.areas

    # set areas by type
    @kingdoms = @areas.where(type: "Kingdom")
    @cities = @areas.where(type: "City")
    @places = @areas.where(type: "Place")

    formatted_areas_by_relationship = []
    @kingdoms.each do |kingdom|
      # create array of cities belonging to kingdom
      cities = Area.where(area_id: kingdom.id)
      cities_in_kingdom = []
      cities.each do |city|
        # create array of places belonging to city
        places = Area.where(area_id: city.id)
        places_in_city = []
        places.each do |place|
          places_in_city.push({
            'name' => place.name,
            'id' => place.id
          })
        end
        cities_in_kingdom.push({
          'name' => city.name,
          'id' => city.id,
          'places' => Array.new(places_in_city)
        })
      end
      formatted_areas_by_relationship.push({
        'name' => kingdom.name,
        'id' => kingdom.id,
        'cities' => Array.new(cities_in_kingdom)
      })
    end
    @formatted_areas_by_relationship = formatted_areas_by_relationship

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
        :pantheon,
        :map)
    end
end
