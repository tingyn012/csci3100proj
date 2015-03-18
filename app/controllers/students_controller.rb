class StudentsController < ApplicationController
  def show
    @student = Student.find(params.permit(:id)[:id])
  end
end
