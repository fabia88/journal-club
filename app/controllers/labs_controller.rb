class LabsController < ApplicationController
  def show
    @lab = Lab.find(param[:id])
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
