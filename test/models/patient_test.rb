require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
   disable_solr
   @patient = create(:patient)
  end

  test 'should concatenatinate first name and last name and return full name' do
    assert_equal "#{@patient.first_name} #{@patient.last_name}", @patient.full_name
  end

  test 'email should be present' do
    patient = build(:patient, email: nil)
    assert_not patient.valid?
    patient = build(:patient, email: 'test@test.com')
    assert patient.valid?
  end

  test 'email should be valid' do
    patient = build(:patient, email: 'xyz')
    assert_not patient.valid?
    patient = build(:patient, email: 'test@test.com')
    assert patient.valid?
  end


  test 'first name should be present' do
    patient = build(:patient, first_name: nil)
    assert_not patient.valid?
    patient = build(:patient, first_name: 'Jhon')
    assert patient.valid?
  end

  test 'last name should be present' do
    patient = build(:patient, last_name: nil)
    assert_not patient.valid?
    patient = build(:patient, last_name: 'Deo')
    assert patient.valid?
  end

  test 'mrn should be present' do
    patient = build(:patient, mrn: nil)
    assert_not patient.valid?
    patient = build(:patient, mrn: '345345345')
    assert patient.valid?
  end

end
