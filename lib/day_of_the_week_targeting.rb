# frozen-string-literal: true

require 'csv'
require 'date'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

days_of_week = contents.map do |row|
  name = row[:first_name]
  reg_date = row[:regdate]

  date = Date.strptime(reg_date, '%m/%e/%y %k:%M')

  puts "#{name} #{reg_date} #{date} #{date.wday} #{Date::DAYNAMES[date.wday]}"

  date.wday
end

days_of_week_tally = days_of_week.tally

days_of_week_tally.keys.sort.each do |day|
  puts "#{Date::DAYNAMES[day]} has #{days_of_week_tally[day]} registrations"
end
