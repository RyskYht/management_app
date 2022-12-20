class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.where(school_id: get_school_id)
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @lessonteacher = Lesson_Teacher.new
    @lessonstudent = Lesson_Student.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lessonteacher = Lesson_Teacher.new(lessonteacher_params)
    @lessonstudent = Lesson_Student.new(lessonstudent_params)

    if @lesson.save && @lessonteacher.save && @lessonstudent.save
      redirect_to lessons_url, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    if @lesson.update(lesson_params) && @lessonteacher.update(lessonteacher_params) && @lessonstudent.update(lessonstudent_params)
      redirect_to lessons_url, notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy
    redirect_to lessons_url, notice: "削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:school_id, :room_id, :name, :start, :end, :content, :hourly_pay, :monthly_pay, :month)
    end

    def lessonteacher_params
      params.require(:lessonteacher).permit(:techer_ids[])
    end

    def lessonstudent_params
      params.require(:lessonstudent).permit(:student_ids[])
    end
end
