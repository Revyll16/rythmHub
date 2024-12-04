class MusiciansController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_action :set_musician, only: [:show]

  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
    @musician = Musician.new
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
    params.require(:musician).permit(:name, :bio, :address, :image_url)
  end
end
