class PostsController < ApplicationController
  def create
    @forum = Forum.find(params[:forum_id])
    @post = Post.new(post_params)
    @post.forum = @forum
    @post.musician = current_user.musician

    if @post.save!
      if @post.save
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append(:posts, partial: "posts/post",
              target: "posts",
              locals: { post: @post })
          end
          format.html { redirect_to forum_path(@forum) }
        end
      else
        render "forums/show", status: :unprocessable_entity
      end
    end

  end

  private

  def post_params
    params.require(:post).permit(:content, :forum_id)
  end
end
