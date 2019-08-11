class Room

  attr_reader :name, :guests_in_room, :playlist

  def initialize(name)
    @name = name
    @guests_in_room = []
    @playlist = []
  end

  def add_new_guest(name)
    @guests_in_room.push(name)
  end

  def add_to_playlist(song)
    @playlist.push(song)
  end

end
