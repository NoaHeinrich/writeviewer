class DescriptionsController < ApplicationController
  before_action :set_description, only: [:show, :edit, :update, :destroy]

  def new
    @description = Description.new
    @video = Video.find(params[:video_id])
  end

  def create
    current_user = User.find(session[:user_id])
    @video = Video.find(params[:video_id])
    @description = Description.new(description_params)
    if @description.save
      current_user.descriptions << @description
      @video.description = @description
      redirect_to @video
    else
      render video
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_description
    @description = Description.find(params[:id])
  end

  def description_params
    params.require(:description).permit(:content, :rating)
  end
end
