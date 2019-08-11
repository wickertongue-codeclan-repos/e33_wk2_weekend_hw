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

  def get_guests_in_room(room)
    room.guests_in_room
  end

  def number_of_guests_in_room(room)
    room.guests_in_room.count
  end

  def check_in(guest, room)
    room.add_guest_to_room(guest)
    room.max_space -= 1
  end

  def check_out_individual(guest, room)
    room.remove_guest_from_room(guest)
  end

  def check_out_room(room)
    room.clear_room
  end


  # def find_guests_in_room(room)
  #   @rooms.each do |room|
  #     if guest.name == name
  #       return guest
  #     end
  #   end
  #     return nil
  # end

end
