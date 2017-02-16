class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :student
      t.references :mentor

      t.string     :topic

      t.datetime   :start_time

      t.timestamps
    end
  end
end
