class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
    @composition = Composition.new
  end

  def show
    @composition = Composition.find(params[:id])

    @feedbacks = @composition.feedbacks
    @feedback = Feedback.new
  end

  def new
    @musician = Musician.find(current_user.musicians.last.id)
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(composition_params)
    @composition.musician = current_user.musicians.first
    if @composition.save
      redirect_to musician_path(current_user.musicians.first), notice: 'Composition was successfully created.'
    else
      @compositions = Composition.all
      # render :new, status: :unprocessible_entity
      flash.now[:alert] = @composition.errors.full_messages.to_sentence # Display error messages

      render :index
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

  def create_feedback
  @composition = Composition.find(params[:composition_id])
  @feedback = @composition.feedbacks.build(feedback_params)

  if @feedback.save
    redirect_to @composition, notice: 'Feedback was successfully added.'
  else
    # Reload feedbacks to show errors and keep the user on the same page
    @feedbacks = @composition.feedbacks
    flash.now[:alert] = 'Failed to add feedback.'
    render :show, status: :unprocessable_entity
  end
end

  private

  def set_composition
    @composition = Composition.find(params[:id])
  end

  def composition_params
    params.require(:composition).permit(:title, :file, :description)
  end
  def feedback_params
    params.require(:feedback).permit(:content)  # Ensure you're permitting the correct attributes
  end
end
