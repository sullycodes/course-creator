class StudentsController < ApplicationController
layout "logged_in"

    def index
        if params[:teacher_id]      
            @teacher = Teacher.find(params[:teacher_id])
            if @teacher
              @students = @teacher.students
            elsif !@teacher
              redirect_to teachers_path
            end
        else
            @students = Student.all
        end
    end

    def new
      @teacher = Teacher.find(params[:teacher_id])
      @student = Student.new
    end

    def create
      @teacher = Teacher.find(params[:teacher_id])
      @student = Student.create(student_params)
      @student.teacher = @teacher
      @student.save
      if @student.save
        redirect_to teacher_student_path(@teacher, @student)
        #render :show
      else
        render :new
      end
    end

    def show
        @student = Student.find(params[:id])
        @teacher = Teacher.find(params[:teacher_id])
        @courses = @teacher.courses          
        if !@student
          redirect_to teacher_students_path
        end
    end

    def edit
      @student = Student.find(params[:id])
      @teacher = Teacher.find(params[:teacher_id])
    end

    def update
      @student = Student.find(params[:id])
      @teacher = Teacher.find(params[:teacher_id])
      @student.update(student_params)
      render :show
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to teacher_students_path
    end

  #  # send student model from show to students#enroll (get 'students/enroll' in routes)
  #  def enroll
  #   @student = Student.find(params[:id])
  #   @teacher = Teacher.find(@student.teacher.id)
  #   @courses = @teacher.courses
  #   if !@courses
  #     redirect_to teacher_path(@teacher)
  #   end
  #   #show a form that lists the teachers courses that the teacher can enroll them in and be able to select it via a dropdown
  # end

  # def create_enrollment
  #   @warning = false
  #   @student = Student.find(params[:student_id])
  #   @teacher = Teacher.find(@student.teacher_id)
  #   @course = Course.find_by(params[:title])
  #   if !@student.courses.include?(@course) 
  #     @student.courses << @course
  #     render :show
  #   # else
  #   #   @warning = true
  #   #   render :enroll
  #   end
  # end

  # def unenroll
  #   @student = Student.find(params[:id])
  #   @teacher = Teacher.find(@student.teacher_id)
  #   @courses = @teacher.courses
  #   if !@courses
  #     redirect_to teacher_student_path(@student)
  #   end
  # end


    private 

    def student_params
      params.require(:student).permit(:name, :bio, :strengths, :weaknesses, :interests, :grades, course_ids: [])
    end

end
