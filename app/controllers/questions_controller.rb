class QuestionsController < ApplicationController
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

    def edit
        @question = Question.find_by id: params[:id]
    end

    def update
        @question = Question.find_by id: params[:id]        
        if @question.update question_params
            flash[:success] = "Question updated"
            redirect_to questions_path
        else
            render :new
        end
    end

    def destroy
        @question = Question.find_by id: params[:id]
        if @question.destroy
            flash[:success] = "Question deleted"
        else
            flash[:danger] = "Something went wrong"
        end
        redirect_to questions_path
    end
    
    def show
        @question = Question.find_by id: params[:id]
    end

    private
    
    def question_params
        params.required(:question).permit(:title, :body)
    end
end