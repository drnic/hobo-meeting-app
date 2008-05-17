class Meeting < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    body :text
    date :date
    start_time :time
    end_time :time
    timestamps
  end

  has_many :meeting_attendances, :dependent => :destroy
  has_many :attendees, :through => :meeting_attendances, :source => :user, :managed => true

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.administrator?
  end

  def updatable_by?(user, new)
    user.administrator?
  end

  def deletable_by?(user)
    user.administrator?
  end

  def viewable_by?(user, field)
    true
  end

end
