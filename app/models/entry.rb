class Entry < ActiveRecord::Base
  enum entry_type: [ :credit, :debit ]
  belongs_to :week

  validates :week, :entry_type, :description, :date, :value, presence: true

  scope :pending, -> { where('entries.date >= ?', Date.today) }
end