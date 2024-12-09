class MusiciansController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_action :set_musician, only: [:show]

  def index
    @musicians = Musician.all
    if params[:query].present?
      sql_subquery = <<~SQL
      musicians.name @@ :query
      OR musicians.bio @@ :query
      OR musicians.address @@ :query
      OR users.email @@ :query
    SQL
    @musicians = @musicians.joins(:user).where(sql_subquery, query: params[:query])
    end
  end

  def show
    @musician = Musician.find(params[:id])
    @compositions = @musician.compositions
  end

  def new
    @musician = Musician.new
  end

  def edit
    @musician = Musician.find(params[:id])
    @compositions = @musician.compositions
  end

  def update
    @musician = Musician.find(params[:id])
    @musician.update(musician_params)
    redirect_to musician_path(@musician)
  end

  def new
    @musician = Musician.new

  end

  def create
    @musician = Musician.new(musician_params)
    @musician.user = current_user
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
