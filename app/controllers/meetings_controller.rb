class MeetingsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :new_meeting_attendance

end
