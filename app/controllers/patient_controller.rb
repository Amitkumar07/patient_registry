class PatientController < ApplicationController

  LIMIT = 10

  def new
    @patient = Patient.new
  end

  def index
    @total_patients = Patient.count
    @total_pages = (Patient.count.to_f/LIMIT).ceil
    get_patient(params[:page])
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
    params.require(:patient).permit(:first_name, :last_name, :email, :zip, :mrn, :dob, :mobile_number, :is_insured)
  end

  def get_patient(page)
    @page = page.present? ? params[:page] : 1
    @patients = Patient.offset((@page.to_i-1) * LIMIT).limit(LIMIT)
  end

end
