class Karaoke_Bar

  attr_reader :name, :rooms, :till

  def initialize(name)
    @name = name
    @till = 0
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
    room.number_of_guests_in_room
  end

## problem - room space and guests in room reset when too many guests are added using the below method
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

  def check_out_room_split_tab(room)
    amount_per_person =
    room.tab / room.number_of_guests_in_room
    room.guests_in_room.each do |guest|
      guest.pays_tab(amount_per_person)
      @till += amount_per_person
    end
    room.clear_room
  end

  # def check_out_room_no_split(room)
  #   room.clear_room
  # end

  def add_money_to_till(money)
    @till += money
  end

end
