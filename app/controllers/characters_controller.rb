class CharactersController < ApplicationController

  def index
    @character = Character.all
  end

  def new
    @character = Character.new
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to action: :index
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to @character
    else
      render 'new'
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
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
        :history)
    end

end
