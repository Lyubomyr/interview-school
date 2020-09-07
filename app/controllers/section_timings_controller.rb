class SectionTimingsController < ApplicationController
  before_action :set_section_timing, only: [:show, :edit, :update, :destroy]

  # GET /section_timings
  # GET /section_timings.json
  def index
    @section_timings = SectionTiming.all
  end

  # GET /section_timings/1
  # GET /section_timings/1.json
  def show
  end

  # GET /section_timings/new
  def new
    @section_timing = SectionTiming.new
  end

  # GET /section_timings/1/edit
  def edit
  end

  # POST /section_timings
  # POST /section_timings.json
  def create
    @section_timing = SectionTiming.new(section_timing_params)

    respond_to do |format|
      if @section_timing.save
        format.html { redirect_to @section_timing, notice: 'Section timing was successfully created.' }
        format.json { render :show, status: :created, location: @section_timing }
      else
        format.html { render :new }
        format.json { render json: @section_timing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_timings/1
  # PATCH/PUT /section_timings/1.json
  def update
    respond_to do |format|
      if @section_timing.update(section_timing_params)
        format.html { redirect_to @section_timing, notice: 'Section timing was successfully updated.' }
        format.json { render :show, status: :ok, location: @section_timing }
      else
        format.html { render :edit }
        format.json { render json: @section_timing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_timings/1
  # DELETE /section_timings/1.json
  def destroy
    @section_timing.destroy
    respond_to do |format|
      format.html { redirect_to section_timings_url, notice: 'Section timing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_timing
      @section_timing = SectionTiming.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_timing_params
      params.require(:section_timing).permit(:section, :day, :start_time, :end_time, :start_time_hours, :start_time_minutes, :start_time_am_pm, :end_time_hours, :end_time_minutes, :end_time_am_pm)
    end
end
