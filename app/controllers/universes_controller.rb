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

    # results = []
    # @kingdoms.each do |kingdom|
    #   results.push({ 'name' => kingdom.name, 'id' => kingdom.id })
    # end

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

    # places_with_id = []
    # @places.each do |place|
    #   places_with_id.push({
    #     'name' => place.name,
    #     'id' => place.id,
    #     'area_id' => place.area_id
    #   })
    # end
    # @formatted_places = places_with_id

    # results.each_with_index do |kingdom, index|
    #   kingdom_id = Area.find(kingdom['id'])
    #   cities = Area.where(area_id: kingdom_id.id)
    #   results[index]['cities'] = cities.map { |city| { name: city.name, id: city.id } }
    #   # find the places belonging to that city
    #   cities.each do |city|
    #     city_id = Area.find(city[:id])
    #     places = Area.where(area_id: city[:id])
    #     results[index]['cities'].each do |place|
    #       place['places'] = places.map { |place| { name: place.name, id: place.id } }
    #     end
    #   end
    # end
    # @formatted_data = results

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
