class CharactersController < ApplicationController
  def index
    @character = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @universe  = @character.universe
    @items = @character.items
    @area = @character.area
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to @character
    else
      render 'new'
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.update_attributes(character_params)
    redirect_to :action => 'show', :id => @character
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to action: :index
  end

  private
    def character_params
      params.require(:character).permit(:name,
        :intelligence,
        :patience,
        :charisma,
        :strength,
        :endurance,
        :agility,
        :constitution,
        :gold,
        :weapon,
        :description,
        :history,
        :health,
        :armor,
        :level,
        :career,
        :attack,
        :defense,
        :perception,
        :weight,
        :weight_penalty,
        :race,
        :clan,
        :spells,
        :abilities,
        :skills,
        :powers,
        :languages,
        :magic_save,
        :mind_save,
        :weather_save,
        :poison_save,
        :force_save,
        :notes,
        :universe_id,
        :area_id)
    end
end
