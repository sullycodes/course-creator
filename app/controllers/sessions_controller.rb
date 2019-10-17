class SessionsController < ApplicationController

    def new
    end

    def create
        @teacher = Teacher.find_by(username: params[:username])
        if @teacher && @teacher.authenticate(params[:password])
            session[:user_id] = @teacher.id
            flash[:success] = "You have successfully logged in."
            redirect_to teacher_path(@teacher)
        else
            flash[:warning] = "Invalid username or password."
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out."
        redirect_to '/login'
    end

end
