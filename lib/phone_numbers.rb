# frozen-string-literal: true

require 'csv'

def clean_phone_number(phone_number)
  numbers_only = phone_number.delete('^[0-9]')
  numbers_only = numbers_only[1..] if numbers_only.length == 11 && numbers_only[0] == '1'
  numbers_only.length == 10 ? "#{numbers_only[..2]}-#{numbers_only[3..5]}-#{numbers_only[6..]}" : '000-000-0000'
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  phone_number = row[:homephone]

  puts "#{name} #{phone_number} #{clean_phone_number(phone_number)}"
end
