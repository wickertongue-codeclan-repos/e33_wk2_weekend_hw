class Room

  attr_reader :name, :guests_in_room, :playlist, :tab
  attr_accessor :max_space

  def initialize(name, max_space)
    @name = name
    @max_space = max_space
    @guests_in_room = []
    @playlist = []
    @tab = []
  end

  def add_guest_to_room(guest)
    @guests_in_room.push(guest)
  end

  def add_to_playlist(song)
    @playlist.push(song)
  end

  def remove_guest_from_room(guest)
    @guests_in_room.delete(guest)
  end

  def clear_room
    @guests_in_room.clear
  end


end
