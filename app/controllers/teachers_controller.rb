class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    if session[:user_type] == "school"
      @teachers = Teacher.where(school_id: session[:user_id])
    end
  end

  # GET /teachers/1 or /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to teachers_url, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_url, notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: "削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:school_id, :login_id, :password, :name, :email, :address, :tel, :birthday)
    end
end
