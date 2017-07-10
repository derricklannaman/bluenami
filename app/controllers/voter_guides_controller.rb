class VoterGuidesController < ApplicationController

  def index
    @guides = current_user.organization.voter_guides.order(created_at: :desc)
  end

  def new
    @guide = VoterGuide.new
  end

  def create
    @guide = VoterGuide.new(voter_guide_params)
    @guide.organization_id = params[:organization_id]
    @guide.year = params[:voter_guide][:year]
    @guide.url = "#{current_user.organization.name}/#{params[:voter_guide][:election_name]}"
    respond_to do |format|
      if @guide.save
        format.html { redirect_to voter_guides_path, notice: "#{@guide.election_name} was successfully created." }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @guide = VoterGuide.find(params[:id])
    @offices = @guide.offices
  end

  private

    def voter_guide_params
      params.require(:voter_guide).permit(:election_name, :year, :organization_id, :url)
    end

end
