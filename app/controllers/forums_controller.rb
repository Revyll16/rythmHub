class ForumsController < ApplicationController

  class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]


    def index
      @forums = Forum.all
      @forums = Forum.includes(:musician)
    end


    def show
    end


    def new
      @forum = Forum.new
    end


    def create
      @forum = Forum.new(forum_params)
      if @forum.save
        redirect_to @forum, notice: 'Forum was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end


    def edit
    end


    def update
      if @forum.update(forum_params)
        redirect_to @forum, notice: 'Forum was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end


    def destroy
      @forum.destroy
      redirect_to forums_url, notice: 'Forum was successfully destroyed.'
    end

    private


    def set_forum
      @forum = Forum.find(params[:id])
    end


    def forum_params
      params.require(:forum).permit(:title, :musician_id)
    end
  end

end
