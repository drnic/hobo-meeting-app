class CreateMeetingAttendances < ActiveRecord::Migration
  def self.up
    create_table :meeting_attendances do |t|
      t.string   :status
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :meeting_id
    end
    
    change_column :meetings, :start_time, :time
    change_column :meetings, :end_time, :time
  end

  def self.down
    change_column :meetings, :start_time, :datetime
    change_column :meetings, :end_time, :datetime
    
    drop_table :meeting_attendances
  end
end
