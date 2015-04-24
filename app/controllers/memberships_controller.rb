class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: params[:user], petition_id: params[:petition_id])
    if @membership.save!
      redirect_to state_path(id: params[:id]), notice: "You've signed this petition!"
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to user_path
  end

end
