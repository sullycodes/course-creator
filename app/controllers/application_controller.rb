class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :owns_resource?
    helper_method :authorize
    helper_method :logged_in?

    helpers   

    def logged_in?
        !!current_user
    end

    def current_user
        Teacher.find_by(id: session[:teacher_id])
    end

    def owns_resource?(resource)
        resource.teacher == current_user
    end

    def authorize(resource)
        if !owns_resource?(resource)
            redirect_to '/403.html'
        end
    end

    def authenticate
        if !logged_in?
            flash[:warning] = "You must log in."
            redirect_to '/login'
        end
    end

    

    # def authorize
    #     session[:teacher_id] == params[:id]
    # end

   


    # def authorized_courses?
    #     courses = current_user.courses
    #     if params[:id] == current
    # end

    # def fields_not_empty?
    #     !params[:name].empty? && !params[:location].empty? 
    #     && !params[:elevation].empty? && !params[:content].empty?
    # end

end
