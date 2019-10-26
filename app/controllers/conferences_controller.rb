class ConferencesController < ApplicationController

    layout "logged_in"

        before_action :authenticate
    
        def index
            @teacher = Teacher.find(session[:teacher_id])
        end
    
        def new
            @conference = Conference.new
            @teacher = Teacher.find(session[:teacher_id])
            @parents = @teacher.parents
        end
    
        def create
            @teacher = Teacher.find(session[:teacher_id])
            @parent = Parent.find(params[:conference][:parent_id])
            #@conference = Conference.create(conference_params)
            @conference = Conference.create(
                teacher_id: @teacher.id,
                parent_id: @parent.id,
                date: params[:conference][:date],
                time: params[:conference][:time]
            )
            if @conference.save
                redirect_to conference_path(@conference)
            else
                render :new
            end
        end
    
        def show
            @teacher = Teacher.find(session[:teacher_id])
            @conference = Conference.find(params[:id])
            authorize(@conference)
        end
    
        def edit
            @conference = Conference.find(params[:id])
            authorize(@conference)
        end
    
        def update
            @conference = Conference.find(params[:id])
            authorize(@conference)
            @conference.update(conference_params)
            redirect_to conference_path(@conference)
        end
    
        def destroy
            @conference = conference.find(params[:id])
            @conference.destroy
            redirect_to conferences_path
        end
    
        private
    
        def conference_params
            params.require(:conference).permit(:teacher_id, :parent_id, :date, :time)
        end
        
end

