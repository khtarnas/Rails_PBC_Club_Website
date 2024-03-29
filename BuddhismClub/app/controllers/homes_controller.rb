class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    @home = Home.all
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
    @forecast, @min_temp, @max_temp = @home.city_info
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)
    @city = home_params[:city].capitalize
    @home.city = @city

    respond_to do |format|
      if @home.save
        format.html { redirect_to user_home_path(User.find(@home.user_id), @home), notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to user_home_path(User.find(@home.user_id), @home), notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to user_homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find_by(user_id: params[:user_id])
      unless @home
        if params[:user_id] == current_user.id.to_s

          @home = Home.new(user_id: params[:user_id])
          respond_to do |format|
            if @home.save
              format.html { redirect_to user_home_path(User.find(@home.user_id), @home), notice: 'Home was successfully created.' }
              format.json { render :show, status: :created, location: @home }
            else
              format.html { render :new }
              format.json { render json: @home.errors, status: :unprocessable_entity }
            end
          end

        else
          link = '/users/' + params[:user_id]
          respond_to do |format|
            format.html { redirect_to link, alert: 'This user has not yet set a home.' }
            format.json { head :no_content }
          end
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def home_params
      params.require(:home).permit(:city, :user_id)
    end
end
