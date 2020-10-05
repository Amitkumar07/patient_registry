class PatientController < ApplicationController

  before_action :page,:search_service, only: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

 LIMIT = 10

  def new
    @patient = Patient.new
  end

  def index
    @patients, @total_patients ,@total_pages = @search_service.search(search_params, LIMIT)
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = 'Patient was successfully created'
      redirect_to patient_path(@patient.id)
    else
      flash[:alert] = 'Patient was not created successfully'
      redirect_back(fallback_location: authenticated_root_path)
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    patient = @patient.update(patient_params)
    if patient
      flash[:notice] = 'Patient was successfully updated'
      redirect_to patient_path(@patient.id)
    else
      flash[:alert] = 'Patient was not updated successfully'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.destroy
      flash[:notice] = 'Patient was successfully deleted'
    else
      flash[:alert] = 'Patient was not deleted successfully'
    end
    redirect_back(fallback_location: authenticated_root_path)
  end


  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :zip, :mrn, :dob, :mobile_number, :is_insured, documents: [])
  end

  def search_params
    params.permit(:sort_by, :order, :term, :is_insured, :page)
  end

  def page
    @page = search_params[:page].present? ? params[:page].to_i : 1
  end

  def search_service
    @search_service = SearchService.new
  end

  def record_not_found
    flash[:alert] = "Wrong Patient ID"
    redirect_back(fallback_location: authenticated_root_path)
  end


end
