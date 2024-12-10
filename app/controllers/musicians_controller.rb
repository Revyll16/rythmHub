class MusiciansController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  before_action :set_musician, only: [:show]

  def index
    @musicians = Musician.geocoded

    # The `geocoded` scope filters only musicians with coordinates
    @markers = @musicians.geocoded.map do |musician|
      {
        lat: musician.latitude,
        lng: musician.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {musician: musician}),
        marker_html: render_to_string(partial: "marker")
      }
    end

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
    @composition = Composition.new
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
    @musician.user = current_user # Assuming each musician is linked to a user

    # Handling instruments (assuming instruments come as a comma-separated string)
    instrument_ids = params[:musician][:instruments]
    # Create or find instruments and associate them with the musician
    instrument_ids.each do |id|
      if id != ""
        instrument = Instrument.find_or_create_by(id: id.to_i)
        @musician.instruments << instrument
      end
    end

    if @musician.save
      redirect_to @musician, notice: 'Musician was successfully created.'

    else
      render :new # If there are validation errors or failure
    end
  end


  private

  def set_musician
    @musician = Musician.find(params[:id])
  end

  def musician_params
    params.require(:musician).permit(:name, :bio, :image_url, :address)
  end

end
