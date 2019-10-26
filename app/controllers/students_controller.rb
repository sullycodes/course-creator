class StudentsController < ApplicationController
layout "logged_in"

    before_action :authenticate

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
      #@parent = Parent.create(parent_params)
      @parent = Parent.create(name: params[:student][:parent_name], phone: params[:student][:parent_phone], email: params[:student][:parent_email])
      if @parent.save
        @student.parent = @parent
        @student.save
        redirect_to teacher_student_path(@teacher, @student)
      else
        render :new
      end
    end

    def show
        @student = Student.find(params[:id])
        @teacher = Teacher.find(params[:teacher_id])
        @courses = @teacher.courses
        authorize(@student)          
        if !@student
          redirect_to teacher_students_path
        end
    end

    def edit
      @student = Student.find(params[:id])
      @teacher = Teacher.find(params[:teacher_id])
      authorize(@student)          
    end

    def update
      @student = Student.find(params[:id])
      @teacher = Teacher.find(params[:teacher_id])
      authorize(@student)          
      @student.update(student_params)
      render :show
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to teacher_students_path
    end

    private 

    def student_params
      params.require(:student).permit(:name, :bio, :strengths, 
                                    :weaknesses, :interests, :grades, course_ids: [])
    end

    # def parent_params
    #   params.require(:student).permit(:parent_name, :parent_phone, :parent_email) 
    # end

end
