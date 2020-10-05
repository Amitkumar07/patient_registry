class XmlService
  require 'nokogiri'

  def self.import(file)
    file_string = File.read(file)
    xml = Nokogiri.XML(file_string)
    headers = xml.xpath('//root').attr('headers').value.split(',')
    patient_info = []
    xml.xpath('//PatientInfo').each do |zone|
      patient_info << zone.elements.map{|element| element.text}
    end
    return  headers, patient_info
  end

  def self.export(export_params)
    datum, total_count, total_pages =  SearchService.new.search(export_params, nil)
    xml = Nokogiri::XML::Builder.new { |xml|
        xml.root(headers: 'dob,email,first_name,is_insured,last_name,mobile_number,mrn,zip') do
          datum.each do |data|
            xml.PatientInfo  do
              xml.first_name data.first_name
              xml.last_name data.last_name
              xml.dob data.dob
              xml.is_insured data.is_insured
              xml.email data.email
              xml.mobile_number data.mobile_number
              xml.mrn data.mrn
              xml.zip data.zip
            end
        end
      end
    }.to_xml
    file = "#{Rails.root}/tmp/patient_#{Time.current}.xml"
    File.open(file, "w") do |f|
      f.write(xml)
    end
    file
  end

end