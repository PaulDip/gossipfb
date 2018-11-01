class GossipsController < ApplicationController
  before_action :set_gossips
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  # GET users/1/gossips
  def index
    @gossips = @user.gossips
  end

  # GET users/1/gossips/1
  def show
  end

  # GET users/1/gossips/new
  def new
    @gossip = @user.gossips.build
  end

  # GET users/1/gossips/1/edit
  def edit
  end

  # POST users/1/gossips
  def create
    @gossip = @user.gossips.build(gossip_params)

    if @gossip.save
      redirect_to([@gossip.user, @gossip], notice: 'Gossip was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/gossips/1
  def update
    if @gossip.update_attributes(gossip_params)
      redirect_to([@gossip.user, @gossip], notice: 'Gossip was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/gossips/1
  def destroy
    @gossip.destroy

    redirect_to user_gossips_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossips
      @user = User.find(params[:user_id])
    end

    def set_gossip
      @gossip = @user.gossips.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end
