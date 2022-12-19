class SchoolsController < ApplicationController
  before_action :set_school, only: %i[ show edit update destroy ]

  # GET /schools or /schools.json
  def index
    if session[:user_type] == "manager"
      @schools = School.where(manager_id: session[:user_id])
    end
  end

  # GET /schools/1 or /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools or /schools.json
  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_url, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    if @school.update(school_params)
      redirect_to schools_url, notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy
    redirect_to schools_url, notice: "削除しました。"
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
