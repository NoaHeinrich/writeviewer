class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  def index
    @videos = Video.includes(:description).where(description = nil)
  end

  def new
    @video = Video.new
    if session[:user_id] == nil
      redirect_to login_path
    end
  end

  def search
    search = params[:search]
    @videos = Video.search_by_title(search)
    render :index
  end

  def create
    current_user = User.find(session[:user_id])
    @video = Video.new(video_params)
    video_info = VideoInfo.new(@video.url)
    @video.embed_code = video_info.embed_code
    @video.title = video_info.title
    @video.thumbnail = video_info.thumbnail_medium
    if @video.save && video_info.available?
      current_user.uploads << @video
      redirect_to current_user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to @video
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:url, :description, :title, :embed_code, :thumbnail)
  end
end
