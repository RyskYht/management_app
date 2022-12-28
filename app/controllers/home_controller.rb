class HomeController < ApplicationController
  before_action :set_current_user, only: %i[ dashboard ]
  
  def top
  end

  def login_form
  end

  def login
    case params[:user_type]
      when "manager"
        @user = Manager.find_by(login_id: params[:login_id])
      when "school"
        @user = School.find_by(login_id: params[:login_id])
      when "teacher"
        @user = Teacher.find_by(login_id: params[:login_id])
      when "family"
        @user = Family.find_by(login_id: params[:login_id])
      when "student"
        @user = Student.find_by(login_id: params[:login_id])
    end
      
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
      if params[:login_id] == "admin"
        session[:user_type] = "admin"
      else
        session[:user_type] = params[:user_type]
      end
      redirect_to "/dashboard", notice: "ログインしました"
    else
      @error_message = "ログインIDまたはパスワードが間違っています"
      session[:user_id] = nil
      session[:user_type] = nil
      render :login_form, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to "/", notice: "ログアウトしました"
  end
  
  def dashboard
  end

  def report
  end

  def payslip
  end

  def sales
  end

end
