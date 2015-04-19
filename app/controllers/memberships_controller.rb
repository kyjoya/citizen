class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: params[:user], petition_id: params[:petition_id])
    if @membership.save!
      redirect_to state_petition_path(id: params[:petition_id],
        state_id: params[:state]), notice: "You've signed this petition!"
    end
  end

  def destroy
    binding.pry
  end

end
