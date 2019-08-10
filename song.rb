class Song

  attr_reader :track_name, :artist_name, :genre, :location_on_playlist

  def initialize(track_name, artist_name, genre)
    @artist_name = artist_name
    @track_name = track_name
    @genre = genre
    @location_on_playlist = 0
  end


end
