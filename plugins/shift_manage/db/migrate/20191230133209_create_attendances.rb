class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    unless ActiveRecord::Base.connection.table_exists?('Attendances')
      create_table :attendances, :primary_key => :id do |t|
        t.datetime :check_in_time
      end
    end
  end
end
