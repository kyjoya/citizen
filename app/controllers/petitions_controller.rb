class PetitionsController < ApplicationController
  def index
    @state = State.find_by(name: params[:state_id])
    @petition = Petition.new

    if params[:search]
      @petitions = Petition.search(params[:search])
    else
      @petitions = Petition.page(params[:page]).
      per(3)
    end
  end

  def new
    @petition = Petition.new
  end

  def create
    @state = State.find_by(name: params[:state_id])
    @petition = @state.petitions.new(petition_params)
    @petition.owner_id = current_user.id


    if @petition.save
      redirect_to state_path(@state), notice: "Added."
    else
      redirect_to state_path(@state), notice: "Not valid. Please provide a name and description."
    end
  end

  def show
    @petition = Petition.find(params[:id])
    @state = State.find_by(name: params[:state_id])
  end

  def edit
    @petition = Petition.find(params[:id])
    @state = State.find_by(id: params[:state_id])
  end

  def update
    @petition = Petition.find(params[:id])
    @petition.update_attributes(petition_params)
    if @petition.save
      redirect_to user_path, notice: "Petition updated!"
    else
      @errors = @petition.errors.full_messages
      render :edit
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    redirect_to user_path
  end

  def petition_params
    params.require(:petition).permit(:name, :description, :image)
  end
end
