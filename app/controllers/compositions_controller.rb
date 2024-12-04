class CompositionsController < ApplicationController
  before_action :set_musician

  def index
    @compositions = @musician.compositions
  end

  def create
    @composition = @musician.compositions.build(composition_params)
    if @composition.save
      redirect_to musician_compositions_path(@musician), notice: 'Composition was successfully created.'
    else
      render :index
    end
  end

  private

  def set_musician
    @musician = Musician.find(params[:musician_id])
  end

  def composition_params
    params.require(:composition).permit(:title, :video_url, :description)
  end
end
