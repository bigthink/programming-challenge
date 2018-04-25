class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def find
    @video = Video.find(params[:id])
    # give chart thing its data
  end
end
