require 'CSV'

def parse_csv(file_path)
  csv_arr = CSV.read(file_path)
  header = csv_arr.shift
  split = 1

  while csv_arr.first do
    CSV.open("split_#{split}.csv", "wb") do |csv|
      csv << header
      (0..15).each do
        row = csv_arr.shift
        csv << row unless row.nil?
      end
    end
    split += 1
  end
  puts "CSV splitting is complete. Have a nice day!"
end

file_path = ARGV[0]
raise('Please supply a filepath to a CSV') if file_path.nil?

parse_csv(file_path)
