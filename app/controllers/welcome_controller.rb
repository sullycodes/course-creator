class WelcomeController < ApplicationController
  def home
    if session[:teacher_id]
      @teacher = Teacher.find(session[:teacher_id])
      redirect_to teacher_path(@teacher)
    end
  end
end
