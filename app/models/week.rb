class Week < ActiveRecord::Base
  has_many :entries

  validates :start_date, :end_date, presence: true

  scope :current, -> { where('end_date >= ?', Date.today) }

  def to_s
    "#{self.start_date} ~ #{self.end_date}"
  end
end
