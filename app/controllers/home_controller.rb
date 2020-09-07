require "prawn"

class HomeController < ApplicationController
  def welcome
    @student = Student.new
  end

  def find_student
    nickname = params['student_nickname']
    if nickname
      @student = Student.find_by(nickname: nickname)

      if @student
        session[:student_id] = @student.id
        flash.notice = "Welcome back. Now you can choose your classes."
        redirect_to student_sections_path
      else
        flash.alert = "Student with nickname: #{nickname} not found."
        redirect_to welcome_path
      end
    end
  end

  def student_sections
    @section_timings = SectionTiming.order_by_time
    @student_sections_ids = SectionTimingStudent.where(student_id: session[:student_id]).pluck(:section_timing_id)
  end

  def add_student_section
    section_timing = SectionTiming.find(params[:id])

    section = SectionTimingStudent.new(section_timing_id: section_timing.id, student_id: session[:student_id])
    if section.save
      flash.notice = "You are now visiting #{section_timing.title}"
    else
      flash.notice = section.errors.messages[:base].join(', ')
    end
    redirect_to student_sections_path
  end

  def remove_student_section
    section_timing = SectionTiming.find(params[:id])
    SectionTimingStudent.find_by(section_timing_id: section_timing.id, student_id: session[:student_id]).destroy

    flash.notice = "You are now NOT visiting #{section_timing.title}"
    redirect_to student_sections_path
  end

  def student_sections_pdf
    student = Student.find(session[:student_id])
    section_timings = student.section_timings.includes(section: [:classroom, teacher_subject: [:teacher, :subject]]).order_by_time

    send_data generate_pdf(section_timings),
              filename: "#{student.first_and_last_name}.pdf",
              type: "application/pdf"
  end

  private

  def generate_pdf(section_timings)
    Prawn::Document.new do
      section_timings.map do |section_timing|
        text "#{section_timing.day} - #{section_timing.start_time_to_s} - #{section_timing.end_time_to_s}", align: :center
        text "Classroom: #{section_timing.section.classroom.title}"
        text "Teacher: #{section_timing.section.teacher_subject.teacher.first_and_last_name}"
        text "Subject: #{section_timing.section.teacher_subject.subject.name}"
      end
    end.render
  end
end
