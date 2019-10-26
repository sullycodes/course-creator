class ParentsController < ApplicationController

layout "logged_in"

    before_action :authenticate

    def index
        @parents = Teacher.find(session[:teacher_id]).parents
    end

    def show
        @parent = Parent.find(params[:id])
        parent_authorize(@parent)          
    end

    def edit
        @parent = Parent.find(params[:id])
        parent_authorize(@parent)          
    end
  
    def update
        @parent = Parent.find(params[:id])
        parent_authorize(@parent)          
        @parent.update(parent_params)
        render :show
    end

    def destroy
        @parent = Parent.find(params[:id])
        @parent.destroy
        redirect_to parents_path
    end

    private
    
    def parent_params
        params.require(:parent).permit(:name, :phone, :email)
    end

    # def current_user
    #     Teacher.find_by(id: session[:teacher_id])
    # end

    def owns_parent?(parent)
        parent.student.teacher == current_user
    end

    def parent_authorize(parent)
        if !owns_parent?(parent)
            redirect_to '/403.html'
        end
    end

end
