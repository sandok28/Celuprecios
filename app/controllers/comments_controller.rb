class CommentsController < ApplicationController
  def create

  	@comment = current_user.comments.new(comment_params) 
    @aa = User.find(@comment.comentador)
    if @comment.save
    	redirect_to usershow_path(@aa.name)
    end
  end
 
  private

  def comment_params
    params.require(:comment).permit(:comentador,:like,:body,:tipo)
  end

end
