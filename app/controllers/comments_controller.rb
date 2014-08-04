class CommentsController < ApplicationController
  def index

  end

  def new

  end

  def create

    @post =  Post.find(params[:post_id])
    @comment = @post.comments.build(params_comment)
    if @comment.save
       redirect_to @post, notice: 'Comment was added.'
    else
       redirect_to @post, notice: 'Comment not added.'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def params_comment
      params.require(:comment).permit(:content)
    end

end
