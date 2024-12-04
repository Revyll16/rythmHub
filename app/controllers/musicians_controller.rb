class MusiciansController < ApplicationController
  
  before_action :set_musician, only: [:show]

  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end


    def edit
      @musician = Musician.find(params[:id])
    end

    def update
      @musician = Musician.find(params[:id])
      @musician.update(musician_params)
      redirect_to musician_path(@musician)
    end

  def create
    @musician = Musician.new(musician_params)
    if @musician.save
      redirect_to @musician, notice: 'Musician was successfully created.'
    else
      render :new
    end
  end

  private

  def set_musician
    @musician = Musician.find(params[:id])
  end


    def musician_params
      params.require(:musician).permit(:name, :image_url, :address, :bio)
    end
end