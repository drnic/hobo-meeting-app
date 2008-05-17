class MeetingAttendance < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    status :string
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :meeting

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest?
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
