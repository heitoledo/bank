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
    @entry = Entry.new(entry_params)
    @entry.save

    respond_with @entry
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
      params.require(:entry).permit(:week_id, :entry_type, :description, :date, :value)
    end
end
