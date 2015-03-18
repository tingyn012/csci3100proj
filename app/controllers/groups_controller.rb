class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :add_student]

  respond_to :html

  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @course = Course.find(group_params[:course_id])
    @group = Group.new(group_params)
    @course.groups << @group
    @group.save
    respond_with(@group)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end
  
  # GET /courses/1/join
  def join
  end
  
  # POST /courses/1/join
  def add_student
    if student_signed_in?
      @group.students << current_student
      flash[:notice] = "joint successfully"
      redirect_to @group
    else
      flash[:alert] = "not logged in"
      redirect_to "/"
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:course_id)
    end
end
