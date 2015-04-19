class StatesController < ApplicationController
  def show
    @state = State.find_by(name: params[:id])
    state_representatives = CivicAPI.new
    @state_info = state_representatives.civic_api_call(params[:id])
    @petitions = Petition.state_search(params[:search], @state)
  end
end
