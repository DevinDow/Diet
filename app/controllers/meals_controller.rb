class MealsController < ApplicationController
  before_action :set_day, only: [:index, :new, :create]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /days/:day_id/meals/1
  # GET /days/:day_id/meals/1.json
  def index
    @meals = @day.meals.order(:minutes_since_midnight).all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /days/:day_id/meals/new
  def new
    @meal = Meal.new
    Time.zone = 'Pacific Time (US & Canada)'
    @meal.time_of_day = Time.zone.now
    puts @meal.time_of_day
    puts @meal.time_of_day.zone
  end

  # GET /meals/1/edit
  def edit
    @day = @meal.day
  end

  # POST /days/:day_id/meals
  # POST /days/:day_id/meals.json
  def create
    @meal = @day.meals.create(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal.day, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal.day, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    day = @meal.day
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to day_url(day), notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:day_id])
      puts @day.inspect
    end

    def set_meal
      @meal = Meal.find(params[:id])
      puts @meal.inspect
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:minutes_since_midnight, :foods, :categories => [])
    end
end
