class Appointment < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :mentor,  class_name: 'User', foreign_key: 'mentor_id'
end
