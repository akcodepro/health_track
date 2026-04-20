class HealthEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @health_entries = current_user.health_entries
  end

  def show
    @health_entry = HealthEntry.find(params[:id])
  end

  def new
    @health_entry = HealthEntry.new
  end

  def edit
    @health_entry = HealthEntry.find(params[:id])
  end


  def create
    @health_entry = current_user.health_entries.new(health_entry_params)

    if @health_entry.save
      redirect_to @health_entry
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @health_entry = HealthEntry.find(params[:id])

    if @health_entry.update(health_entry_params)
      redirect_to @health_entry
    else
      render :edit
    end
  end

  def destroy
    @health_entry = HealthEntry.find(params[:id])
    @health_entry.destroy
    redirect_to health_entries_path
  end


  private
  def health_entry_params
    params.require(:health_entry).permit(:mood, :energy, :sleep_hours, :water_litres, :notes, :date, :user_id)
  end
end
