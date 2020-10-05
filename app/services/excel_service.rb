class ExcelService
  require 'roo'

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).map do |i|
      data << spreadsheet.row(i)
    end
    return header, data
  end

  def self.export(export_params)

  end

end