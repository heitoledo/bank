class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_weeks, only: [:new, :create, :edit, :update]
  before_action :set_types, only: [:new, :create, :edit, :update]

  def index
    @weeks = Week.includes(:entries).current.order('entries.date ASC')
  end

  def archive
    @weeks = Week.includes(:entries).order('entries.date ASC')
    render :index
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    times = entry_params[:times].to_i
    times.times do |i|
      @entry = Entry.new(entry_params)
      @entry.description = "#{@entry.description} (#{i+1}/#{times})" if times > 1
      @entry.date = @entry.date + i.month
      @entry.week = Week.where('start_date <= :date AND end_date >= :date',
      { date: @entry.date }).first
      @entry.save
    end

    redirect_to entries_url, notice: 'Entry was successfully created.'
  end

  def update
    @entry.update(entry_params)
    respond_with @entry
  end

  def destroy
    @entry.destroy
    respond_with @entry
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def set_weeks
      @weeks = Week.current
    end

    def set_types
      @types = Entry.entry_types
    end

    def entry_params
      params.require(:entry).permit(:week_id, :entry_type, :description, 
        :date, :value, :times)
    end
end
