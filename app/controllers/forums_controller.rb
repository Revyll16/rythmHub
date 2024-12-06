

  class ForumsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :create ]

    before_action :set_forum, only: [:show, :edit, :update, :destroy]


    def index
      @forums = Forum.all
    end


    def show
      @post = Post.new
    end


    def new
      @forum = Forum.new
    end

    def create
      @musician = current_user.musician
      @forum = Forum.new(forum_params)
      @forum.musician = @musician
      if @forum.save
        redirect_to @forum, notice: 'Forum was successfully created.'
      else
        puts @forum.errors.full_messages
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
      params.require(:forum).permit(:title, :image_url, :musician_id)
    end
  end
