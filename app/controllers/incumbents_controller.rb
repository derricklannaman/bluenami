class IncumbentsController < ApplicationController
  before_action :set_incumbent, only: [:show, :edit, :update, :destroy]

  # GET /incumbents
  # GET /incumbents.json
  def index
    redirect_to voter_guides_path
  end

  # GET /incumbents/1
  # GET /incumbents/1.json
  def show
  end

  # GET /incumbents/new
  def new
    @incumbent = Incumbent.new
  end

  # GET /incumbents/1/edit
  def edit
  end

  # POST /incumbents
  # POST /incumbents.json
  def create
    @incumbent = Incumbent.new(incumbent_params)
    @incumbent.office_id = params[:office_id]
    respond_to do |format|
      if @incumbent.save
        format.html { redirect_to voter_guide_path(params[:guide_id]), notice: 'Incumbent was successfully created.' }
        format.json { render :show, status: :created, location: @incumbent }
      else
        format.html { render :new }
        format.json { render json: @incumbent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incumbents/1
  # PATCH/PUT /incumbents/1.json
  def update
    respond_to do |format|
      if @incumbent.update(incumbent_params)
        format.html { redirect_to @incumbent, notice: 'Incumbent was successfully updated.' }
        format.json { render :show, status: :ok, location: @incumbent }
      else
        format.html { render :edit }
        format.json { render json: @incumbent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incumbents/1
  # DELETE /incumbents/1.json
  def destroy
    @incumbent.destroy
    respond_to do |format|
      format.html { redirect_to incumbents_url, notice: 'Incumbent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incumbent
      @incumbent = Incumbent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incumbent_params
      params.require(:incumbent).permit(:first_name, :last_name, :party, :bio)
    end
end
