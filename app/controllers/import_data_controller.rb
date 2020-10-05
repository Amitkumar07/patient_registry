class ImportDataController < ApplicationController

  before_action :import_service, :only=> :save_patient

  def import_patient
    @patient = Patient.new
  end

  def save_patient
    columns,values = @import_data_service.data(params[:import][:file])
    byebug
    patients = Patient.import columns, values, validate: true, validate_uniqueness: true, track_validation_failures: true
  end

  private

  def import_params
    params.require(:import).permit(:file)
  end

  def import_service
    @import_data_service = ImportDataService.new
  end

end
