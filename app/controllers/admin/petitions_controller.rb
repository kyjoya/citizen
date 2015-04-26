class Admin::PetitionsController < ApplicationController
  before_action :authenticate!

  def index
    @petitions = Petition.limit(20)
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    redirect_to admin_petitions_path
  end
end
