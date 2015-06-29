module Api
  class ProblemSetsController < ApiController
    def index
      @problem_sets = ProblemSet.includes(
        :problems, :answers, :hints).all
      render :index
    end

    def show
      @problem_set = ProblemSet.includes(
        :problems, :answers, :hints).find(params[:id])
      if params[:date]

      end

      render :show
    end
  end
end
