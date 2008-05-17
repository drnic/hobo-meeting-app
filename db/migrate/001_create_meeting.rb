class CreateMeeting < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.string   :title
      t.text     :body
      t.date     :date
      t.time     :start_time
      t.time     :end_time
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :username
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :meetings
    drop_table :users
  end
end
