module Api
  class HintsController < ApiController
    def show
      @hint = Hint.find(params[:id])
      render json: @hint
    end
  end
end
