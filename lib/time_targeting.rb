# frozen-string-literal: true

require 'csv'
require 'time'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

hours = contents.map do |row|
  name = row[:first_name]
  reg_date = row[:regdate]

  time = Time.strptime(reg_date, '%m/%e/%y %k:%M')

  puts "#{name} #{reg_date} #{time} #{time.hour}"

  time.hour
end

hours_tally = hours.tally

hours_tally.keys.sort.each do |hour|
  puts "#{hour}:00 had #{hours_tally[hour]} registrations"
end
