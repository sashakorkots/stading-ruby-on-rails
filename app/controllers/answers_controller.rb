class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, extend: :create

  def update
    if @answer.update answer_params
      flash[:success] = 'Answer updated'
      redirect_to question_path(@question, anchor: "answer-#{@answer.id}")
    else
      render :edit
    end
  end

  def edit; end

  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = "Answer created"
      redirect_to question_path(@question)
    else
      flash[:danger] = "Answer doesn`t created"
      @answers = @question.answers.order created_at: :desc
      render "questions/show"
    end
  end

  def destroy
    if @answer.destroy
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

  def set_answer
    @answer = @question.answers.find params[:id]
  end
end
