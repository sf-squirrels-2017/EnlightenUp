User.destroy_all
Appointment.destroy_all

def datetime_in_next_week
  now           = DateTime.now
  week_from_now = DateTime.now + 7

  time_between  = Time.at((week_from_now.to_f - now.to_f)*rand + now.to_f).to_s

  DateTime.parse( time_between )
end

coinflip_array = [ true, false ]

users_array = 26.times.map do
  flip_result = coinflip_array.sample
  flip_result ? subject_matter = Faker::Pokemon.name : subject_matter = nil
  flip_result ? current_phase = rand(2..3) : current_phase = rand(1..2)

  User.create!( name: Faker::Name.first_name,
                email: Faker::Internet.email,
                password_digest: 'password', # this should be the encrypted password
                phase: current_phase,
                is_mentor: flip_result,
                expertise: subject_matter)
end

mentors_array = users_array.find_all do |user|
  user.is_mentor == true
end

students_array = users_array - mentors_array


appointments_array = []

mentors_array.each do |mentor|
  number_of_slots = rand(1..4)
  number_of_slots.times.map do
    new_appointment = Appointment.create!( mentor_id: mentor.id,
                                           start_time: datetime_in_next_week)
    appointments_array << new_appointment
  end
end

available_appointments = appointments_array.find_all do |appointment|
  appointment.student_id == nil
end

students_array.each do |student|
  if available_appointments != []
    available_appointments.sample.update_attributes( student_id: student.id )
  end
end
