class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def show
    @composition = Composition.find(params[:id])
  end

  def new
    @musician = Musician.find(current_user.musicians.last.id)
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(composition_params)
    @composition.musician = current_user.musicians.first
    if @composition.save
      redirect_to @composition, notice: 'Composition was successfully created.'
    else
      render :new, status: :unprocessible_entity
    end
  end

  def edit
    @composition = Composition.find(params[:id])
  end

  def update
    if @composition.update(composition_params)
      redirect_to @composition, notice: 'Composition was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @composition.destroy
    redirect_to compositions_url, notice: 'Composition was successfully destroyed.'
  end

  private

  def set_composition
    @composition = Composition.find(params[:id])
  end

  def composition_params
    params.require(:composition).permit(:title, :file, :description) 
  end
end
