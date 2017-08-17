class ParticipantsController < ApplicationController
  def new
    @lab = Lab.find(params[:lab_id])
    @participant = Participant.new
    if !current_user.joined_labs.include?(@lab)
      redirect_to root_path
      flash[:alert] = "Only accepted participants can invite."
    elsif @lab.archived == true
      redirect_to root_path
      flash[:alert] = "Cannot invite to an archived lab."
    elsif current_user.participants.find_by_lab_id(@lab).status == "pending"
      redirect_to root_path
      flash[:alert] = "Cannot invite while status is pending."
    end
  end

  def create
    @lab = Lab.find(params[:lab_id])
    @user = User.find_by_email(params[:participant][:email])
    @participant = Participant.new(
      lab: @lab,
      user: @user,
      status: "pending"
      )
    if @lab.participants.find_by(user: @user)
      redirect_to root_path
      flash[:alert] = "This user is already a participant."
    elsif @participant.save
      redirect_to lab_path(@lab)
      flash[:notice] = "Succesfully invited #{@user.first_name} to #{@lab.name}."
    else
      render 'new'
    end
  end
end
