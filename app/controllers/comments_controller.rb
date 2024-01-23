class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save 
      render json: @comment, status: :created
    else 
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
end
private
def comment_params
  params.require(:comment).permit(:commenter, :body)
end
