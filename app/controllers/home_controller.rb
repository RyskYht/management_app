class HomeController < ApplicationController
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
      when "student"
        @user = Student.find_by(login_id: params[:login_id])
      when "family"
        @user = Family.find_by(login_id: params[:login_id])
    end
      
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:user_type] = params[:user_type]
      redirect_to "/dashboard", notice: "ログインしました"
    else
      @error_message = "ログインIDまたはパスワードが間違っています"
      @login_id = params[:login_id]
      @password = params[:password]
      session[:user_id] = nil
      session[:user_type] = nil
      render :login_form
      
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to "/", notice: "ログアウトしました"
  end
  
  def dashboard
    case session[:user_type]
      when "manager"
        @user = Manager.find_by(session[:user_id])
      when "school"
        @user = School.find_by(session[:user_id])
      when "teacher"
        @user = Teacher.find_by(session[:user_id])
      when "student"
        @user = Student.find_by(session[:user_id])
      when "family"
        @user = Family.find_by(session[:user_id])
    end
  end
end
