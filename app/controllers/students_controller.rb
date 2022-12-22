class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students
  def index
    if session[:user_type] == "school"
      @students = Student.where(school_id: session[:user_id])
    elsif session[:user_type] == "teacher"
      @teacher = Teacher.find_by(session[:user_id])
      @students = Student.where(school_id: @teacher.school_id)
    end
  end
  
  # GET /students/1 Familyのindexにリンク
  def family_index
    @students = Student.where(family_id: params[:family_id])
  end

  # GET /students/1/1
  def show
  end

  # GET /students/1/new
  def new
    @student = Student.new
  end

  # POST /students/1
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to "/students", notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /students/1/1/edit
  def edit
  end

  # PATCH/PUT /students/1/1
  def update
    if @student.update(teacher_params)
      redirect_to "/students", notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /students/1/1
  def destroy
    @student.destroy
    redirect_to "/students", notice: "削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:school_id, :family_id, :login_id, :password, :name, :email, :tel, :birthday, :school_name, :grade, :admission_date, :expulsion_date, :memo)
    end
end
