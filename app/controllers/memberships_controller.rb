class MembershipsController < ApplicationController
  def new
    @lab = Lab.find(params[:lab_id])
    @membership = Membership.new
    if !current_user.joined_labs.include?(@lab) || !(current_user.memberships.find_by_lab_id(@lab).status == "accepted")
      redirect_to root_path
      flash[:alert] = "Only accepted members can invite."
    elsif @lab.archived == true
      redirect_to root_path
      flash[:alert] = "Cannot invite to an archived lab."
    end
  end

  def create
    @lab = Lab.find(params[:lab_id])
    @user = User.find_by_email(params[:membership][:email])
    if @membership = @lab.memberships.where(user_id: @user.id).first
      @membership.status = "pending"
    else
      @membership = Membership.new(
        lab: @lab,
        user: @user,
        status: "pending"
        )
    end

    if @lab.memberships.not_cancelled.find_by(user: @user)
      redirect_to root_path
      flash[:alert] = "This user is already a member."
    elsif @membership.save
      redirect_to lab_path(@lab)
      flash[:notice] = "Succesfully invited #{@user.first_name} to #{@lab.name}."
    else
      render 'new'
    end
  end

  def accept
    @membership = Membership.find(params[:id])
    @membership.status = "accepted"
    @lab = @membership.lab
    if current_user.memberships.find_by_lab_id(@lab)
      if @membership.save
        redirect_to lab_path(@lab)
        flash[:notice] = "Succesfully accepted membership for #{@lab.name}."
      end
    else
      redirect_to lab_path(@lab)
      flash[:alert] = "Only the invitee can accept."
    end
  end

  def deny
    @membership = Membership.find(params[:id])
    @membership.status = "denied"
    @lab = @membership.lab
    if @membership.save
      redirect_to lab_path(@lab)
      flash[:notice] = "Succesfully denied membership for #{@lab.name}."
    end
  end

  def cancel
    @membership = Membership.find(params[:id])
    @membership.status = "cancelled"
    @lab = @membership.lab
    if @membership.save
      redirect_to lab_path(@lab)
      flash[:notice] = "Succesfully cancelled invitation for #{@membership.user.first_name}."
    end
  end
end
