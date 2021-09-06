class FriendsController < ApplicationController
  # autocomplete :friend, :first_name, :full => true

    before_action :force_json, only: :search
  autocomplete :friend, :first_name


  def index
    puts params
    @friends = Friend.search(params[:search])
    # render json: @friends.map(&:first_name)
    # @friends = Friend.all

  end

  def search
    q = params[:search].downcase
    @friend = Friend.where("first_name LIKE ? or last_name LIKE ?", "%#{q}%", "%#{q}%").limit(5)

  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def edit
    @friend = Friend.find(params[:id])
    puts @friend
  end


  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      flash[:success] = "Woohoo!, Friend Added"
      redirect_to @friend
    else
      render :new
    end
  end


  def update
    @friend = Friend.find(params[:id])

    if @friend.update(friend_params)
      flash[:success] = "Woohoo!, Friend Details Edited"

      redirect_to @friend
    else
      render 'edit'
    end
  end


  def destroy
    print("aahgsjhaghg")
    @friend = Friend.find(params[:id])
    @friend.destroy
    params[:id] = nil

    flash[:alert] = "Alerting you the Friend has been deleted!"

    #
    #
    #
    # respond_to do |format|
    #   if @friend.destroy
    #     format.html { redirect_to friends_url }
    #     format.json { head :no_content }
    #   else
    #     format.html # do something here
    #     format.json { head :no_content }
    #   end
    # end

    redirect_to friends_path
  end


  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :search)
  end

  def force_json
    request.format = :json
  end
end
