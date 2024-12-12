

  class ForumsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :create ]
    before_action :authenticate_user!
    before_action :set_forum, only: [:show, :edit, :update, :destroy]


    def index
      @forums = Forum.all
    end


    def show
      @post = Post.new
      @forums = Forum.all
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
        redirect_to forum_path(@forum), alert: 'You are not authorized to edit this forum.' unless @forum.musician == current_user.musician
    end


    def update
      if @forum.update(forum_params)
        redirect_to @forum, notice: 'Forum was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end


    def destroy
      if @forum.musician == current_user.musician
        @forum.posts.destroy_all
        @forum.destroy
        redirect_to forums_url, notice: 'Forum and its posts were successfully deleted.'
        # redirect_to forums_url, notice: 'Forum was successfully deleted.'
      else
        redirect_to forums_url, alert: 'You are not authorized to delete this forum.😌'
      end
    end





    private


    def set_forum
      @forum = Forum.find(params[:id])
    end


    def forum_params
      params.require(:forum).permit(:title, :image, :musician_id)
    end
  end
