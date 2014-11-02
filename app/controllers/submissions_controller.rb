class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  def log
    submission = Submission.find(params[:id])
    container = Docker::Container.get(submission.container_hash)
    @out = container.logs(stdout: 1)
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)

    respond_to do |format|
      if @submission.save
        lines = @submission.code.split("\n")
        args = []
        lines.each do |line|
          args << '-e' << line
        end
        container = Docker::Container.create({'Cmd' => ['ruby'] + args, 'Image' => 'ruby'})
        container.commit
        @submission.update_attribute(:container_hash, container.id)
        @submission.update_attribute(:status, 'created')

        #######
        finished = false
        submission = Submission.last
        container = Docker::Container.get(submission.container_hash)
        container.start
        @submission.update_attribute(:status, 'started')
        while(!finished) do
          sleep(5)
          ids = Docker::Container.all.map &:id
          finished = !ids.include?(container.id)
        end
        @out = container.logs(stdout: 1)
        ############

        format.html { redirect_to submissions_path, notice: 'Submission was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:code, :user_id, :problem_id)
    end
end
