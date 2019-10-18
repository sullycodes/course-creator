class StudentsController < ApplicationController

    # def index
    #     @students = Student.where("teacher_id= ?", params[:teacher_id])
    #     @teacher = Teacher.find(params[:teacher_id])
    # end

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

    def show
        # binding.pry
        @student = Student.find(params[:id])
        if !@student
          redirect_to teachers_students_path
        else
          render :show
        end
    end


end
