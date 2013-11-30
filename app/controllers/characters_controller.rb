class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def show
    @character = Character.find(params[:id])
  end

end
