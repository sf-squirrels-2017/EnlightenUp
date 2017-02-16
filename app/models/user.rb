class User < ApplicationRecord
  has_many :student_appointments, class_name: 'Appointment', foreign_key: 'student_id'
  has_many :mentor_appointments, class_name: 'Appointment', foreign_key: 'mentor_id'
end
