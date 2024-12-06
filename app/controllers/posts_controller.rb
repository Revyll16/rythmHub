class PostsController < ApplicationController
  def create
    @forum = Forum.find(params[:forum_id])
    @post = Post.new(post_params)
    @post.forum = @forum
    @post.musician = current_user.musician

    if @post.save!
      redirect_to forum_path(@post.forum)
    end

  end

  private

  def post_params
    params.require(:post).permit(:content, :forum_id)
  end
end
