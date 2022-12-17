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
      
      if params[:login_id] == "admin"
        session[:user_type] = "admin"
      else
        session[:user_type] = params[:user_type]
      end
      
      flash[:notice] = "ログインしました"
      redirect_to "/"
    else
      @error_message = "ログインIDまたはパスワードが間違っています"
      @login_id = params[:login_id]
      @password = params[:password]
      session[:user_id] = nil
      session[:user_type] = nil
      render "home/login_form"
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/"
  end
end
