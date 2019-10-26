class SessionsController < ApplicationController
layout "logged_in"

    def new
        if session[:teacher_id]
            @teacher = Teacher.find(session[:teacher_id])
            redirect_to teacher_path(@teacher)
        end
    end

    def create
        @teacher = Teacher.find_by(username: params[:username])
        if @teacher && @teacher.authenticate(params[:password])
            session[:teacher_id] = @teacher.id
            flash[:success] = "You have successfully logged in."
            redirect_to teacher_path(@teacher)
        else
            flash[:warning] = "Invalid username or password."
            redirect_to '/login'
        end
    end

    def facebook_create
        @teacher = Teacher.find_or_create_by(uid: auth['uid']) do |t|
            t.name = auth['info']['name']
            t.username = auth['info']['name'].gsub(/\s+/, "").downcase
            t.password = rand_password=('0'..'z').to_a.shuffle.first(60).join
          end       
        session[:teacher_id] = @teacher.id
        redirect_to teacher_path(@teacher)
    end

    def destroy
        session[:teacher_id] = nil
        flash[:success] = "You have successfully logged out."
        redirect_to '/login'
    end


    private
    
    def auth
        request.env['omniauth.auth']
    end

end
