class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers
  def index
    if session[:user_type] == "school"
      @teachers = Teacher.where(school_id: session[:user_id])
    elsif session[:user_type] == "teacher"
      @teacher = Teacher.find_by(session[:user_id])
      @teachers = Teacher.where(school_id: @teacher.school_id)
    end
  end

  # GET /teachers/1
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to teachers_url, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /teachers/1/edit
  def edit
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_url, notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
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
