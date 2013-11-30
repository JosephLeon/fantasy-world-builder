class CharactersController < ApplicationController

  def new
  end

  def show
    @character = Character.find(params[:id])
  end

end
