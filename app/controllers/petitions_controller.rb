class PetitionsController < ApplicationController
  def index
    @state = State.find_by(name: params[:state_id])
    @petitions = @state.petitions.limit(10)#Petition.limit(10).where(state_id: params[:state_id])
    @petition = Petition.new

  end

  def new
    @petition = Petition.new
  end

  def create
    @state = State.find_by(name: params[:state_id])
    @petition = @state.petitions.new(petition_params)
    @petition.owner_id = current_user.id

    if @petition.save
      redirect_to state_petitions_path(@state), notice: "Added."
    else
      redirect_to state_petitions_path(@state), notice: "Not valid. Please provide a name and description."
    end
  end

  def show

  end

  def petition_params
    params.require(:petition).permit(:name, :description)
  end
end
