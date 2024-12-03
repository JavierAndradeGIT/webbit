class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community, only: [ :create, :destroy ]

  def create
    @subscription = current_user.subscriptions.new
    @subscription.community = @community
    @subscription.user = current_user

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to community_path(@community), notice: "You succesfully subscribed." }
      else
        format.html { redirect_to community_path(@community), alert: "Your subscription could not be saved." }
      end
    end
  end

  def show
  end

  def destroy
    @subscription = @community.subscriptions.where(user: current_user).first
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: community_path(@community), notice: "You succesfully unsubscribed." }
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
