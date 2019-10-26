class CoursesController < ApplicationController
layout "logged_in"
    
    before_action :authenticate

    def index
        @teacher = Teacher.find(session[:teacher_id])
        @courses = Course.where("teacher_id= ?", @teacher.id)
    end

    def new
        @course = Course.new
        @teacher = Teacher.find(session[:teacher_id])
        @students = Student.where("teacher_id= ?", @teacher.id)
    end

    def create
        @teacher = Teacher.find(params[:course][:teacher_id])
        @course = Course.create(course_params)
        if @course.save
            @course.teacher = @teacher
            redirect_to course_path(@course)
        else
            render :new
        end
    end

    def show
        @course = Course.find(params[:id])
        authorize(@course)
    end

    def edit
        @course = Course.find(params[:id])
        @teacher = @course.teacher
        authorize(@course)
    end

    def update
        @course = Course.find(params[:id])
        authorize(@course)
        @course.update(course_params)
        redirect_to course_path(@course)
    end

    def destroy
        @course = Course.find(params[:id])
        authorize(@course)
        @course.destroy
        redirect_to courses_path
    end

    private

    def course_params
        params.require(:course).permit(:title, :teacher_id, student_ids: [])
    end

end
