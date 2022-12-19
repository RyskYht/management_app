class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]

  # GET /families or /families.json
  def index
    if session[:user_type] == "school"
      @families = Family.where(school_id: session[:user_id])
    end
  end

  # GET /families/1 or /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families or /families.json
  def create
    @family = Family.new(family_params)

    if @family.save
      redirect_to families_url, notice: "登録が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /families/1 or /families/1.json
  def update
    if @family.update(family_params)
      redirect_to families_url, notice: "情報を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /families/1 or /families/1.json
  def destroy
    @family.destroy
    redirect_to families_url, notice: "削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:school_id, :login_id, :password, :name, :email, :address, :tel, :memo)
    end
end
