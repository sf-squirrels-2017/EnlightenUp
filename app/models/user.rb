class User < ApplicationRecord
  has_many :student_appointments, class_name: 'Appointment', foreign_key: 'student_id'
  has_many :mentor_appointments, class_name: 'Appointment', foreign_key: 'mentor_id'

  validates :name, :email, :password_digest, :phase, presence: true

  has_secure_password

end
