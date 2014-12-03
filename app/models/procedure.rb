class Procedure < ActiveRecord::Base
  belongs_to :patient
  attr_accessible :date, :procedure, :remarks, :tooth_no, :patient_id
  validates :procedure, presence: true
end
