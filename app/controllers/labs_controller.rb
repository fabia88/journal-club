class LabsController < ApplicationController
  def show
    if current_user
      @lab = Lab.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @lab = Lab.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def archive
  end
end

# lab_archive PATCH  /labs/:lab_id/archive(.:format)           labs#archive
#        labs POST   /labs(.:format)                           labs#create
#     new_lab GET    /labs/new(.:format)                       labs#new
#    edit_lab GET    /labs/:id/edit(.:format)                  labs#edit
#         lab GET    /labs/:id(.:format)                       labs#show
#             PATCH  /labs/:id(.:format)                       labs#update
#             PUT    /labs/:id(.:format)                       labs#update
