module Api
  class QuestionsController < ApiController
    def index
      @questions = Question.includes(:answers, :hints).all
      render json: @questions
    end

    def show
      @question = Question.includes(:answers, :hints).find(params[:id])
      render json: @question
    end
  end
end
