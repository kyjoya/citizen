class StatesController < ApplicationController
  def show
    @state = State.find_by(name: params[:id])

    state_representatives = CivicAPI.new
    @state_info = state_representatives.civic_api_call(params[:id])

    word_data = SunlightAPI.new
    @sunlight_info = word_data.sunlight_api_call("economy")

    @petitions = Petition.state_search(params[:search], @state).
      page(params[:page]).
      per(3)

    respond_to do |format|
      format.json { render json: @state.state_word_counts, each_serializer: StateWordCountSerializer }
      format.html
    end
  end
end
