class ManagersController < ApplicationController
  before_action :set_current_user
  before_action :set_manager, only: %i[ edit update destroy ]

  # GET /managers
  def index
    @managers = Manager.all
  end
  
  # GET /managers/new
  def new
    @manager = Manager.new
  end

  # POST /managers
  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      if session[:user_type] == "admin"
        redirect_to managers_path, notice: "登録が完了しました。"
      elsif @manager.login_id == "admin"
        session[:user_type] = "admin"
        session[:user_id] = @manager.id
        redirect_to "/dashboard", notice: "Admin登録が完了しました。ログイン状態です。"
      else
        session[:user_type] = "manager"
        session[:user_id] = @manager.id
        redirect_to "/dashboard", notice: "登録が完了しました。ログイン状態です。"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /managers/1/edit
  def edit
  end

  # PATCH/PUT /managers/1
  def update
    if @manager.update(manager_params)
      redirect_to edit_manager_path(params[:id]), notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /managers/1
  def destroy
    @manager.destroy
    if session[:user_type] == "admin"
      redirect_to managers_path, notice: "削除しました。"
    elsif session[:user_type] == "manager"
      session[:user_id] = nil
      session[:user_type] = nil
      redirect_to "/", notice: "会員情報を削除しました。"
    end
  end

  def manager_login
      session[:user_id] = params[:id]
      session[:user_type] = "manager"
      redirect_to "/dashboard", notice: "経営者アカウントでログインしました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manager_params
      params.require(:manager).permit(:login_id, :password)
    end
end
