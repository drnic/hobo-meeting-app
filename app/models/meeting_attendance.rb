class MeetingAttendance < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    status :string
    timestamps
  end

  belongs_to :user
  belongs_to :meeting

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !guest? #user.administrator?
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
