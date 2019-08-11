class Karaoke_Bar

  attr_reader :name, :rooms, :till

  def initialize(name)
    @name = name
    @till = []
    @rooms = []
    @no_of_guests_to_be_added = []
  end

  def add_new_room(room)
    @rooms.push(room)
  end

  def guests_in_room(room)
    room.guests_in_room
  end

  def number_of_guests_in_room(room)
    room.guests_in_room.count
  end

## problem - room space and guests in room reset when too many guests are added
  def check_in(guest, room)
    if room.current_space > 0
      room.add_guest_to_room(guest)
      room.add_to_tab(15.00)
    else
      room.clear_room
    end
  end

  def check_in_party(total_number_of_guests, guest, room)
    if total_number_of_guests > room.current_space
      puts "There are only #{room.current_space} spaces in the #{room.name}. No more guests can be added at this time"
    else
      room.add_guest_to_room(guest)
      room.current_space -= 1
    end
  end

  def check_out_individual(guest, room)
    room.remove_guest_from_room(guest)
  end

  def check_out_room(room)
    room.clear_room
  end

  def add_money_to_till(money)
    @till.push(money)
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
