class StatesController < ApplicationController
  def show
    @state = State.find_by(name: params[:id])
    url = "https://www.googleapis.com/civicinfo/v2/representatives?key=ENV["GOOGLE_KEY"]&address=#{params[:id]}"
    uri = URI.parse(url)
    state_info = JSON.parse(Net::HTTP.get(uri))
  end
end
