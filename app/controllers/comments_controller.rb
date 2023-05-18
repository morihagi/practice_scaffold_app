class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post), notice: '投稿成功'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
