class DataflowsController < ApplicationController
  before_action :set_dataflow, only: [:show, :edit, :update, :destroy]

  # GET /dataflows
  # GET /dataflows.json
  def index
    @dataflows = Dataflow.all
  end

  # GET /dataflows/1
  # GET /dataflows/1.json
  def show
  end

  # GET /dataflows/new
  def new
    @dataflow = Dataflow.new
  end

  # GET /dataflows/1/edit
  def edit
  end

  # POST /dataflows
  # POST /dataflows.json
  def create
    @dataflow = Dataflow.new(dataflow_params)

    respond_to do |format|
      if @dataflow.save
        format.html { redirect_to @dataflow, notice: 'Dataflow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dataflow }
      else
        format.html { render action: 'new' }
        format.json { render json: @dataflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataflows/1
  # PATCH/PUT /dataflows/1.json
  def update
    respond_to do |format|
      if @dataflow.update(dataflow_params)
        format.html { redirect_to @dataflow, notice: 'Dataflow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dataflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataflows/1
  # DELETE /dataflows/1.json
  def destroy
    @dataflow.destroy
    respond_to do |format|
      format.html { redirect_to dataflows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataflow
      @dataflow = Dataflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataflow_params
      params.require(:dataflow).permit(:dataset_id, :interface_id, :frequency_id)
    end
end
