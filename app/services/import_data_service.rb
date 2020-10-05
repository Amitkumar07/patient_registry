class ImportDataService

  def data(file)
   file_type = file.content_type
    case file_type
      when "text/csv"
       column, value = process_csv(file)
      when "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        column, value = process_excel(file)
      when "application/json"
        column, value =  process_json(file)
    end
   return  column, value
  end

  def process_csv(file)
    require 'csv'
    data = CSV.read(file)
    return data[0], data.drop(1)
  end

  def process_excel(file)
    require 'roo'
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).map do |i|
      data << spreadsheet.row(i)
    end
    return header, data
  end

 def process_json(file)
   require 'json'
   file = File.read(file)
   data_hash = JSON.parse(file)
   header = data_hash[0].keys
   data = []
   data_hash.each do |hash|
     data << hash.values
   end
   return header, data
 end

end