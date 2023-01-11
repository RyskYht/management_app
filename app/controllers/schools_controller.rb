class SchoolsController < ApplicationController
  before_action :set_current_user
  before_action :set_school, only: %i[ show edit update destroy ]

  # GET /schools
  def index
    if session[:user_type] == "admin"
      @schools = School.all
    elsif session[:user_type] == "manager"
      @schools = School.where(manager_id: session[:user_id])
    end
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # POST /schools
  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /schools/1/edit
  def edit
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      redirect_to edit_school_path(params[:id]), notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    redirect_to schools_url, notice: "削除しました。"
  end

  def school_login
      session[:user_id] = params[:id]
      session[:user_type] = "school"
      redirect_to "/dashboard", notice: "塾アカウントでログインしました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:manager_id, :login_id, :password, :name, :email, :address, :tel)
    end
end
