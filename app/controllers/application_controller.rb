class ApplicationController < ActionController::Base
  before_action :set_current_user
  
  def set_current_user
    if session[:user_id] != nil && session[:user_type] != nil
      case session[:user_type]
        when "manager"
          @current_user = Manager.find_by(id: session[:user_id])
        when "school"
          @current_user = School.find_by(id: session[:user_id])
        when "teacher"
          @current_user = Teacher.find_by(id: session[:user_id])
        when "family"
          @current_user = Family.find_by(id: session[:user_id])
        when "student"
          @current_user = Student.find_by(id: session[:user_id])
      end
    end
  end
  
  def get_school_id
    if session[:user_id] != nil && session[:user_type] != nil
      case session[:user_type]
        when "manager"
          return @current_user.school_ids
        when "school"
          return session[:user_id]
        when "teacher", "family", "student"
          return @current_user.school_id
      end
    end
  end
end
