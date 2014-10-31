class LaguagesController < ApplicationController
  before_action :set_laguage, only: [:show, :edit, :update, :destroy]

  # GET /laguages
  # GET /laguages.json
  def index
    @laguages = Laguage.all
  end

  # GET /laguages/1
  # GET /laguages/1.json
  def show
  end

  # GET /laguages/new
  def new
    @laguage = Laguage.new
  end

  # GET /laguages/1/edit
  def edit
  end

  # POST /laguages
  # POST /laguages.json
  def create
    @laguage = Laguage.new(laguage_params)

    respond_to do |format|
      if @laguage.save
        format.html { redirect_to @laguage, notice: 'Laguage was successfully created.' }
        format.json { render :show, status: :created, location: @laguage }
      else
        format.html { render :new }
        format.json { render json: @laguage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laguages/1
  # PATCH/PUT /laguages/1.json
  def update
    respond_to do |format|
      if @laguage.update(laguage_params)
        format.html { redirect_to @laguage, notice: 'Laguage was successfully updated.' }
        format.json { render :show, status: :ok, location: @laguage }
      else
        format.html { render :edit }
        format.json { render json: @laguage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laguages/1
  # DELETE /laguages/1.json
  def destroy
    @laguage.destroy
    respond_to do |format|
      format.html { redirect_to laguages_url, notice: 'Laguage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laguage
      @laguage = Laguage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laguage_params
      params.require(:laguage).permit(:name, :version)
    end
end
