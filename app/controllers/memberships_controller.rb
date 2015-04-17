class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: params[:user_id], petition_id: params[:petition_id])
    if @membership.save!
      redirect_to state_petition_path(state_id: params[:state_id],
          id: params[:petition_id]), notice: "You've signed this petition!"
    end
  end

  def destroy
    binding.pry
    @membership
  end

end
