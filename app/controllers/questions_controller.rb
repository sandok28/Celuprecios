class QuestionsController < ApplicationController
	def create
    
  	@question = current_user.questions.new(question_params) 
    if @question.save
    	redirect_to article_path(@question.article.id)
    
    end
  end
 
  private

  def question_params
    params.require(:question).permit(:article_id,:body)
  end
end
