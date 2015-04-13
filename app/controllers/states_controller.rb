class StatesController < ApplicationController
  def show
    @state = State.find_by(name: params[:id])
  end
end
