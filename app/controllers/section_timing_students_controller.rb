class SectionTimingStudentsController < ApplicationController
  before_action :set_section_timing_student, only: [:show, :edit, :update, :destroy]

  # GET /section_timing_students
  # GET /section_timing_students.json
  def index
    @section_timing_students = SectionTimingStudent.all
  end

  # GET /section_timing_students/1
  # GET /section_timing_students/1.json
  def show
  end

  # GET /section_timing_students/new
  def new
    @section_timing_student = SectionTimingStudent.new
  end

  # GET /section_timing_students/1/edit
  def edit
  end

  # POST /section_timing_students
  # POST /section_timing_students.json
  def create
    @section_timing_student = SectionTimingStudent.new(section_timing_student_params)

    respond_to do |format|
      if @section_timing_student.save
        format.html { redirect_to @section_timing_student, notice: 'Section timing student was successfully created.' }
        format.json { render :show, status: :created, location: @section_timing_student }
      else
        format.html { render :new }
        format.json { render json: @section_timing_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_timing_students/1
  # PATCH/PUT /section_timing_students/1.json
  def update
    respond_to do |format|
      if @section_timing_student.update(section_timing_student_params)
        format.html { redirect_to @section_timing_student, notice: 'Section timing student was successfully updated.' }
        format.json { render :show, status: :ok, location: @section_timing_student }
      else
        format.html { render :edit }
        format.json { render json: @section_timing_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_timing_students/1
  # DELETE /section_timing_students/1.json
  def destroy
    @section_timing_student.destroy
    respond_to do |format|
      format.html { redirect_to section_timing_students_url, notice: 'Section timing student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_timing_student
      @section_timing_student = SectionTimingStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_timing_student_params
      params.require(:section_timing_student).permit(:section_timing_id, :student_id)
    end
end
