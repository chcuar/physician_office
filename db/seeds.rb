# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

specialty = ['Cardiology', 'Dermatology', 'Family Medicine', 'Neurology']
time = ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM', ]

10.times do
  physician = Physician.create(
    name: Faker::Name.name,
    specialty: specialty.sample
  )
    10.times do
      patient = Patient.create(
      name: Faker::Name.name, 
      age: rand(10..50),
      phone_number: Faker::PhoneNumber.cell_phone

      )

    10.times do
      Appointment.create(
        date: Faker::Date.forward(days: 90),
        time: time.sample,
        patient_id: patient.id,
        physician_id: physician.id
      )

    end
  end
end

