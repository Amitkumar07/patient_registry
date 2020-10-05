class JsonService

  def self.import(file)
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

  def self.export(export_params)
    datum, total_count, total_pages =  SearchService.new.search(export_params, nil)
    data_json = []
    datum.each do |data|
      data_json << { first_name: data.first_name, last_name: data.last_name, mrn: data.mrn, zip: data.zip,
                      mobile_number: data.mobile_number, dob: data.dob, is_insired: data.is_insured, email: data.email}
    end
    file = "#{Rails.root}/tmp/patient_#{Time.current}.json"
    File.open(file, "w") do |f|
      f.write(JSON.pretty_generate(data_json))
    end
    file
  end

end