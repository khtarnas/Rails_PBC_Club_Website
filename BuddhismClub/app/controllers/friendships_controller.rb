class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to '/users/', notice: 'Added Friend Successfully!' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { redirect_to '/users/' }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      link = '/users/' + current_user.id.to_s
      format.html { redirect_to link, notice: 'Friend was removed...' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
