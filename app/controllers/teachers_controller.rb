class TeachersController < ApplicationController
layout "logged_in"

    before_action :authenticate, except: [:new, :create]
    
    def index
        @teachers = Teacher.all
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.create(teacher_params) 
        if @teacher.save
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            redirect_to '/signup'
        end
    end

    def show
        @teacher = Teacher.find(params[:id])
        @students = Student.where("teacher_id= ?", @teacher.id)
        if @teacher.id != session[:teacher_id]
            redirect_to '/403.html'
        end
        #@courses = Course.where("teacher_id= ?", @teacher.id)
        #flash[:warning] = "You are not authorized motherfucker!"
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def update
        @teacher = Teacher.find(params[:id])
        @teacher.update(teacher_params)
        redirect_to teacher_path(@teacher)
    end

    def destroy
        @teacher = Teacher.find(params[:id])
        @teacher.destroy
        redirect_to '/login'
    end

    private

    def teacher_params
        params.require(:teacher).permit(:name, :username, :password, :password_confirmation)
    end

end
