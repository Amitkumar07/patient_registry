class DocumentsController < ApplicationController
  before_action :patient
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    @document = @patient.documents.build
  end

  def index
    @documents = @patient.documents
  end

  def create
    if @patient.documents.attach(document_params[:documents])
      flash[:notice] = 'Medical records was successfully created'
      redirect_to patient_documents_path(@patient.id)
    else
      flash[:alert] = 'Medical records was not created successfully'
      redirect_back(fallback_location: authenticated_root_path)
    end
  end

  def destroy
    if @patient.documents.find(params[:id]).purge
      flash[:notice] = 'Medical records was successfully deleted'
    else
      flash[:alert] = 'Medical records was not deleted successfully'
    end
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

  def document_params
    params.require(:attachment).permit(documents: [])
  end

  def patient
    @patient = Patient.find(params[:patient_id])
  end

  def record_not_found
    flash[:alert] = "Wrong Patient ID"
    redirect_back(fallback_location: authenticated_root_path)
  end

end
