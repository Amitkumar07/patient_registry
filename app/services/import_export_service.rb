class ImportExportService

  def import_data(file)
   file_type = file.content_type
    case file_type
      when "text/csv"
       column, value = CsvService.import(file)
      when "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        column, value = ExcelService.import(file)
      when "application/json"
        column, value =  JsonService.import(file)
      when "text/xml"
        column, value =  XmlService.import(file)
    end
   return  column, value
  end

  def export_data(export_params)
    case export_params[:file_format]
      when 'csv'
        file = CsvService.export(export_params)
      when 'json'
        file = JsonService.export(export_params)
      when 'xml'
        file = XmlService.export(export_params)
    end
    file
  end









end