class ExportController < ApplicationController

  before_action :export_service, only: [:create_file]

 def create_file
   file = @export_service.export_data(export_params)
   send_file file, :disposition => 'attachmnet'
 end

  private

  def export_params
    params.permit(:sort_by, :order, :term, :is_insured, :file_format)
  end

  def export_service
    @export_service = ImportExportService.new
  end

end
