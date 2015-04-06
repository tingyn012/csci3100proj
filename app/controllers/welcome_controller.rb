class WelcomeController < ApplicationController
  def index
    if student_signed_in?
      @groups = current_student.groups
      @courses = current_student.courses
    else
      @groups = Group.all
      @courses = Course.all
    end
  end
end
