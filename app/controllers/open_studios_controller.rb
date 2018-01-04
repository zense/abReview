class OpenStudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_open_studio, only: [:show, :edit, :update, :destroy]

  # GET /open_studios
  # GET /open_studios.json
  # def index
  #   @open_studios = OpenStudio.all
  # end

  # GET /open_studios/1
  # GET /open_studios/1.json
  def show
  end

  # GET /open_studios/new
  def new
    @open_studio = OpenStudio.new
  end

  # GET /open_studios/1/edit
  # def edit
  # end

  # POST /open_studios
  # POST /open_studios.json
  def create
    @open_studio = OpenStudio.new(open_studio_params)

    respond_to do |format|
      if @open_studio.save
        format.html { redirect_to @open_studio, notice: 'Open studio was successfully created.' }
        format.json { render :show, status: :created, location: @open_studio }
      else
        format.html { render :new }
        format.json { render json: @open_studio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /open_studios/1
  # PATCH/PUT /open_studios/1.json
  # def update
  #   respond_to do |format|
  #     if @open_studio.update(open_studio_params)
  #       format.html { redirect_to @open_studio, notice: 'Open studio was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @open_studio }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @open_studio.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /open_studios/1
  # DELETE /open_studios/1.json
  # def destroy
  #   @open_studio.destroy
  #   respond_to do |format|
  #     format.html { redirect_to open_studios_url, notice: 'Open studio was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_studio
      @open_studio = OpenStudio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def open_studio_params
      params.require(:open_studio).permit(:name, :affiliation, :interested_in, :email)
    end
end
