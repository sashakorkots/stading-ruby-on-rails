class AnswersController < ApplicationController
  before_action :set_question

  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = "Answer created"
      redirect_to question_path(@question)
    else
      flash[:danger] = "Answer doesn`t created"
      @answers = Answer.order created_at: :desc
      render "questions/show"
    end
  end

  def destroy
    @answer = @question.answers.find_by id: params[:id]
    if @answer .destroy
      flash[:success] = "Question deleted"
    else
      flash[:danger] = "Something went wrong"
    end
    redirect_to question_path(@question)
  end

  private 

  def answer_params
    params.required(:answer).permit(:body)
  end

  def set_question
    @question = Question.find_by id: params[:question_id]
  end
end