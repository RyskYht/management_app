class TuitionsController < ApplicationController
  before_action :set_tuition, only: %i[ show edit update destroy ]

  # GET /tuitions or /tuitions.json
  def index
    @tuitions = Tuition.all
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

    respond_to do |format|
      if @tuition.save
        format.html { redirect_to tuition_url(@tuition), notice: "Tuition was successfully created." }
        format.json { render :show, status: :created, location: @tuition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tuition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuitions/1 or /tuitions/1.json
  def update
    respond_to do |format|
      if @tuition.update(tuition_params)
        format.html { redirect_to tuition_url(@tuition), notice: "Tuition was successfully updated." }
        format.json { render :show, status: :ok, location: @tuition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tuition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuitions/1 or /tuitions/1.json
  def destroy
    @tuition.destroy

    respond_to do |format|
      format.html { redirect_to tuitions_url, notice: "Tuition was successfully destroyed." }
      format.json { head :no_content }
    end
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
