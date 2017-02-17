class User < ApplicationRecord
  has_many :student_appointments, class_name: 'Appointment', foreign_key: 'student_id'
  has_many :mentor_appointments, class_name: 'Appointment', foreign_key: 'mentor_id'

  validates :name, :email, :password_digest, :phase, presence: true

  has_secure_password

  def booked_appointments
  	booked_mentor_appointments = self.mentor_appointments.find_all{|a| a.student_id}

    return booked_mentor_appointments if !booked_mentor_appointments.empty?
    self.student_appointments
  end
end
