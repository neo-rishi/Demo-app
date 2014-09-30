class CommentsController < ApplicationController
  #create comments
  def create
    @post =  Post.find(params[:post_id])
    @comment = @post.comments.build(params_comment.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
         format.html {redirect_to @post, notice: 'Comment was added.'}
         format.json {render json: 'create'}
         format.js {render :nothing => true}

      else
         format.html {redirect_to @post, notice: 'Comment not added.'}
         format.json {render 'create', notice: 'Comment not added.'}
         format.js {render :nothing => true}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def params_comment
      params.require(:comment).permit(:content)
    end

end
