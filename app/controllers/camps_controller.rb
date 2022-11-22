class CampsController < ApplicationController
  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(params[:camp])
    if @camp.save
      redirect_to @camp, :notice => "Successfully created camp."
    else
      render :action => 'new'
    end
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def update
    @camp = Camp.find(params[:id])
    if @camp.update_attributes(params[:camp])
      redirect_to @camp, :notice  => "Successfully updated camp."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy
    redirect_to camps_url, :notice => "Successfully destroyed camp."
  end
end
