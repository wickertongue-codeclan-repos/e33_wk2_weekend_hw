class Karaoke_Bar

  attr_reader :name, :rooms

  def initialize(name)
    @name = name
    @till = []
    @rooms = []
  end

  def add_new_room(room)
    @rooms.push(room)
  end

end
