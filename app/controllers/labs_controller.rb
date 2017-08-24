class LabsController < ApplicationController
  before_action :set_lab, only: [:show, :edit, :update, :archive]

  def index
    if current_user
      @labs = current_user.joined_labs
    else
      redirect_to root_path
      flash[:alert] = "You must be logged in."
    end
  end

  def show
    if current_user
      # && @lab.if_member?(current_user)
      @post = Post.new
      @available_members = @lab.memberships.accepted_members
      # @only_accepted = @lab.memberships.only_accepted_members
    else
      redirect_to root_path
      flash[:alert] = "You must be logged in or be part of this lab."
    end
  end

  def new
    @lab = Lab.new
  end

  def create
    @lab = Lab.new(lab_params)
    @lab.creator = current_user
    if @lab.save
      @membership = Membership.new(status: "accepted")
      @membership.user = current_user
      @membership.lab = @lab
      @membership.save
      redirect_to lab_path(@lab)
      flash[:notice] = "Lab successfully created."
    else
      render 'new'
    end
  end

  def edit
    if @lab.archived?
      redirect_to root_path
      flash[:alert] = "Cannot edit an archived lab."
    elsif !current_user.joined_labs.include?(@lab) || !(current_user.memberships.find_by_lab_id(@lab).status == "accepted")
      redirect_to lab_path(@lab)
      flash[:alert] = "Only accepted members can edit."
    end
  end

  def update
    if @lab.update(lab_params)
      redirect_to lab_path(@lab)
      flash[:notice] = "Lab successfully updated."
    else
      render :edit
    end
  end

  def archive
    @lab.archived = true
    @lab.save
    redirect_to user_path(current_user)
    flash[:notice] = "Lab successfully archived."
  end

  private
  def lab_params
    params.require(:lab).permit(:name, :description, :photo, :photo_cache)
  end

  def set_lab
    @lab = Lab.find(params[:id])
  end
end
