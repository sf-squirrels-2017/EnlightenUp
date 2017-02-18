class Appointment < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id', required: false
  belongs_to :mentor,  class_name: 'User', foreign_key: 'mentor_id'

def open_appointments
  @appointments = Appointment.all
  @appointments.select { |app|  app.student_id == nil }
end

end
