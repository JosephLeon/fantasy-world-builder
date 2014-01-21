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

    results = []
    @kingdoms.each do |kingdom|
      results.push({ 'name' => kingdom.name, 'id' => kingdom.id })
    end
    # @cities.each do |city|
    #   results.push({ 'name' => city.name, 'id' => city.id })
    # end
    results.each_with_index do |kingdom, index|
      kingdom_id = Area.find(kingdom['id'])
      cities = Area.where(area_id: kingdom_id.id)
      results[index]['cities'] = cities.map { |city| { name: city.name, id: city.id } }

      cities.each do |city|
        city_id = Area.find(city[:id])
        places = Area.where(area_id: city[:id])
        results[index]['places'] = places.map { |place| { name: place.name, id: place.id } }
        # results.push({'name' => place[:name]})
        # places = Area.where(area_id: city.id)
      end

    end
    @formatted_data = results

    # city_id = Area.find(cities['id'])
    # places = Area.where(area_id: city_id.id)
    #
    # cityresults = []
    # @cities.each do |city|
    #   cityresults.push({ 'name' => city.name, 'id' => city.id })
    # end
    # cityresults.each_with_index do |city, index|
    #   city_id = Area.find(city['id'])
    #   places = Area.where(area_id: city_id.id)
    #   results[index]['places'] = places.map { |place| { name: place.name, id: place.id } }
    # end
    # @formatted_data_city = cityresults

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
