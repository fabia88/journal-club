class LabsController < ApplicationController
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
      @lab = Lab.find(params[:id])
      @post = Post.new
    else
      redirect_to root_path
      flash[:alert] = "You must be logged in."
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
    @lab = Lab.find(params[:id])
    if @lab.archived?
      redirect_to root_path
      flash[:alert] = "Cannot edit an archived lab."
    elsif !current_user.joined_labs.include?(@lab) || !(current_user.memberships.find_by_lab_id(@lab).status == "accepted")
      redirect_to root_path
      flash[:alert] = "Only accepted members can edit."
    end
  end

  def update
    @lab = Lab.find(params[:id])
    if @lab.update(lab_params)
      redirect_to lab_path(@lab)
      flash[:notice] = "Lab successfully updated."
    else
      render :edit
    end
  end

  def archive
    @lab = Lab.find(params[:id])
    @lab.archived = true
    @lab.save
    redirect_to user_path(current_user)
    flash[:notice] = "Lab successfully archived."
  end

  private
  def lab_params
    params.require(:lab).permit(:name, :description, :photo, :photo_cache)
  end
end
