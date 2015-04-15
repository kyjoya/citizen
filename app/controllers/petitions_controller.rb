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
    @petition = Petition.find(params[:id])
  end

  def edit
    @petition = Petition.find(params[:id])
    @state = State.find_by(id: params[:state_id])
  end

  def update
    @petition = Petition.find(params[:id])
    if @petition.update(petition_params)
      redirect_to user_path, notice: "Petition updated!"
    else
      render :edit, notice: "No"
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    redirect_to user_path
  end

  def petition_params
    params.require(:petition).permit(:name, :description)
  end
end
