class Procedure < ActiveRecord::Base
  belongs_to :patient
  attr_accessible :date, :procedure, :remarks, :tooth_no
  validates :procedure, presence: true
end
