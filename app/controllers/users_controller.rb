class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @owned_petitions = Petition.where(owner_id: @user.id)
  end
end
