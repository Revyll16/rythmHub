class FeedbacksController < ApplicationController
  def create
    @composition = Composition.find(params[:composition_id])
    @feedback = @composition.feedbacks.build(feedback_params)
    @feedback.musician = current_user.musician

    if @feedback.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:feedbacks, partial: "feedbacks/feedback",
            target: "feedbacks",
            locals: { feedback: @feedback })
        end
        format.html { redirect_to composition_path(@composition) }
      end
    else
      render "compositions/show", status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
