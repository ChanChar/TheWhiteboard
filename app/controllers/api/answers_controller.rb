module Api
  class AnswersController < ApiController
    def show
      @answer = Answer.find(params[:id])
      render json: @answer
    end
  end
end
