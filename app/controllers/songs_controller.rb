class SongsController < ApplicationController
  def index
    songs = Song.all 
    render json: songs.as_json
  end

  def show
    song = Song.find_by(id:params[:id])
    render json: song.as_json
  end

  def create
    song = Song.create(
      title: params[:title],
      album: params[:album],
      artist: params[:artist],
      year: params[:year]
    )
    render json: song.as_json
  end

  def update
    song = Song.find_by(id:params[:id])
    song.update(
      title: params[:title],
      album: params[:album],
      artist: params[:artist],
      year: params[:year]
    )
    render json: song.as_json
  end

  def destroy
    song = Song.find_by(id:params[:id])
    song.destroy
    render json: {message: "This song was deleted!"}
  end
end
