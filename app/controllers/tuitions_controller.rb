class TuitionsController < ApplicationController
  before_action :set_tuition, only: %i[ show edit update destroy ]

  # GET /tuitions or /tuitions.json
  def index
    @tuitions = Tuition.where(school_id: get_school_id)
  end

  # GET /tuitions/1 or /tuitions/1.json
  def show
  end

  # GET /tuitions/new
  def new
    @tuition = Tuition.new
  end

  # GET /tuitions/1/edit
  def edit
  end

  # POST /tuitions or /tuitions.json
  def create
    @tuition = Tuition.new(tuition_params)

    if @tuition.save
      redirect_to tuitions_url, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tuitions/1 or /tuitions/1.json
  def update
    if @tuition.update(tuition_params)
      redirect_to tuitions_url, notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tuitions/1 or /tuitions/1.json
  def destroy
    @tuition.destroy
    redirect_to tuitions_url, notice: "削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuition
      @tuition = Tuition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tuition_params
      params.require(:tuition).permit(:school_id, :family_id, :title, :month, :amount, :deadline_date, :payment_date)
    end
end
