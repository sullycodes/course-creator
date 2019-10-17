class TeachersController < ApplicationController

    def index
        @teachers = Teacher.all
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.create(teacher_params) 
        if @teacher.save
            session[:user_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            redirect_to '/signup'
        end
    end

    def show
        @teacher = Teacher.find(params[:id])
        @course = Course.new
        render :show
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
        
    end

    private

    def teacher_params
        params.require(:teacher).permit(:name, :username, :password, :password_confirmation)
    end




end
