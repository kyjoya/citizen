class StatesController < ApplicationController
  def show
    @state = State.find_by(name: params[:id])

    state_representatives = CivicAPI.new
    @state_info = state_representatives.civic_api_call(params[:id])

    word_data = SunlightAPI.new
    @sunlight_info = word_data.sunlight_api_call("economy")
    
    @petitions = Petition.state_search(params[:search], @state) || "no petitions yet!"
  end
end
