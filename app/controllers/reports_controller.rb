class ReportsController < ApplicationController

  def index
    @report = Week.joins(:entries).group(:week_id, :entry_type).sum(:value)
  end

end