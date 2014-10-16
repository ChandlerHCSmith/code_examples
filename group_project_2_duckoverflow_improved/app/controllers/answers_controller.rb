class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    # You should probably using the strong parameters feature here.
    # @answer = Answer.new(answer_params.merge(user_id: session[:user_id]))
    #
    # You did it in QuestionsController, but not here.
    #
    # But, on the other hand, doesn't htat look a bit ugly?  Shouldn't there be
    # a better way?  Perhaps:
    #
    # answer = Question.find(params[:question_id]).answers.create(answer_better_params)
    # if answer.save
    # ...

    @answer = Answer.new(question_id: params[:question_id], user_id: session[:user_id], content: params[:answer][:content])
    p @answer # try not to commit debugging output
    if @answer.save
      redirect_to @answer.question
    else
      redirect_to "/questions/#{params[:question_id]}/answers/new" # You should use the named routes.
      #redirect_to  new_question_answer_path(params[:question_id])
    end
    # Why are all the variables above `@` variables?  You're not passing them
    # to a view since you always redirect  Why make them so?
  end

  private

  def answer_better_params
    params.require(:answer, :user_id, :question_id)
  end

  def answer_params
    params.require(:answer).permit(:question_id)
  end
end
