class ImportController < ApplicationController

  before_action :import_service, :only=> :save_patient

  def import_patient
    @patient = Patient.new
  end

  def save_patient
    columns,values = @import_data_service.import_data(params[:import][:file])
    patients = Patient.import columns, values, validate: true, validate_uniqueness: true, track_validation_failures: true
    Patient.reindex
    flash[:notice] = "#{patients.ids.count} Patients were successfully created"
    redirect_to patient_index_path
  end

  private

  def import_params
    params.require(:import).permit(:file)
  end

  def import_service
    @import_data_service = ImportExportService.new
  end

end
