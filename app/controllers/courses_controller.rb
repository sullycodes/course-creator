class CoursesController < ApplicationController
    
    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        #@course = Course.create(course_params) 
        @course = Course.new(
            title: params[:course][:title],
            teacher_id: params[:course][:teacher]
        )
        binding.pry

        @course.save
        if @course.save
            redirect_to course_path(@course)
        else
            redirect_to '/'
        end
    end

    def show
        @course = Course.find(params[:id])
        render :show
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        @course.update(course_params)
        redirect_to course_path(@course)
    end

    def destroy
        
    end

    private

    def course_params
        params.require(:course).permit(:title, :teacher, student_ids: [])
    end

end

#:teacher_id,