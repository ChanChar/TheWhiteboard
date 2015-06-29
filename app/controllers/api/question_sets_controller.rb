module Api
  class QuestionSetsController < ApiController
    def index
      @question_sets = QuestionSets.includes(:questions, :answers).all
      render :index
    end

    def show
      @question_set = QuestionSets.includes(:questions, :answers).find(params[:id])
      # if params[:due_date]
      #   @question_set = QuestionSets.find_by_due_date(params[:due_date])
      # end
      render :show
    end
  end
end
