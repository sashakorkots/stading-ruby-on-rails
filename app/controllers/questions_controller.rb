class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit update show destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Question created"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update question_params
      flash[:success] = "Question updated"
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = "Question deleted"
    else
      flash[:danger] = "Something went wrong"
    end
    redirect_to questions_path
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order created_at: :desc
  end

  private

  def question_params
    params.required(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find_by id: params[:id]
  end
end
