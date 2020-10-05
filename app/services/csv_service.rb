class CsvService
  require 'csv'

  def self.import(file)
    data = CSV.read(file)
    return data[0], data.drop(1)
  end

  def self.export(export_params)
    datum, total_count, total_pages =  SearchService.new.search(export_params, nil)
    file = "#{Rails.root}/tmp/patient_#{Time.current}.csv"
    headers = ['First Name','Last Name', 'MRN',	'ZIP', 'Mobile Number',	'DOB','Is Insured','Email']
    CSV.open( file, 'w',write_headers: true, headers: headers ) do |writer|
      datum.each do |data|
        writer << [data.first_name, data.last_name, data.mrn, data.zip, data.mobile_number, data.dob, data.is_insured ? 'YES': 'NO', data.email]
      end
    end
    file
  end


end