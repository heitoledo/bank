desc "Create weeks"
task :create_weeks => :environment do
  Week.create({ start_date: (Week.maximum(:end_date) + 1), end_date: (Week.maximum(:end_date) + 7) })
end