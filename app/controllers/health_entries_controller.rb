class HealthEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @health_entries = current_user.health_entries.order(date: :desc).page(params[:page]).per(7)
    @last_7 = current_user.health_entries.where(date: 7.days.ago..Date.today)
    @avg_mood = @last_7.average(:mood)&.round(1)
    @avg_energy = @last_7.average(:energy)&.round(1)
    @avg_sleep = @last_7.average(:sleep_hours)&.round(1)
    @streak = HealthEntry.streak_for(current_user)
    @chart_data_mood = current_user.health_entries.order(date: :asc).pluck(:date, :mood).to_h
    @chart_data_energy = current_user.health_entries.order(date: :asc).pluck(:date, :energy).to_h
    @today_entry = current_user.health_entries.find_by(date: Date.today)
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

  def export
    @health_entries = current_user.health_entries.order(date: :desc)

    respond_to do |format|
      format.csv do
        send_data generate_csv(@health_entries),
          filename: "health_entries_#{Date.today}.csv",
          type: "text/csv"
      end
    end
  end


  private
  def health_entry_params
    params.require(:health_entry).permit(:mood, :energy, :sleep_hours, :water_litres, :notes, :date, :user_id)
  end

  def generate_csv(entries)
    require 'csv'
    CSV.generate(headers: true) do |csv|
      csv << ["Date", "Mood", "Energy", "Sleep Hours", "Water Litres", "Notes"]
      entries.each do |entry|
        csv << [entry.date, entry.mood, entry.energy, entry.sleep_hours, entry.water_litres, entry.notes]
      end
    end
  end
end
