class Rolodex

  @@ids = 1001
	def initialize 
		@contacts = []
    # @ids = 1001
	end

	def add_contact(contact)
    contact.id = @@ids
    @contacts << contact
    @@ids += 1
    contact
	end

  def find_contact(contact_id)
    @contacts.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
    return nil
  end

  def find_all_contacts
    @contacts
  end

  def find_to_delete(contact_id)
    @contacts.each do |contact|
      if contact_id == contact.id
        return contact
      end
    end
    return nil
  end

  def delete_contact(contact_to_delete)
    @contacts.find do |contact|
      if contact_to_delete == contact
        @contacts.delete(contact)
      end
    end
  end

  def modify_contact(contact_id)
    puts "Please select an option:"
    puts "[1] Modify contact's first name"
    puts "[2] Modify contact's last name"
    puts "[3] Modify contact's email"
    puts "[4] Modify contact's note"
    puts "[5] Return to main menu"
    option = gets.chomp.to_i
      case option
        when 1 then modify_first_name(contact_id)
        when 2 then modify_last_name(contact_id)
        when 3 then modify_email(contact_id)
        when 4 then modify_note(contact_id)
        when 5
          return
        else
          puts "Incorrect option. Try again."
      end
    end

  def modify_first_name(id)
    puts "Type new first name:"
    input = gets.chomp
    contact = @contacts.find(id).first
    contact.first_name = input
  end

  def modify_last_name(id)
    puts "Type new last name:"
    input = gets.chomp
    contact = @contacts.find(id).first
    contact.last_name = input
  end

  def modify_email(id)
    puts "Type new email:"
    input = gets.chomp
    contact = @contacts.find(id).first
    contact.email = input
  end

  def modify_note(id)
    puts "Type new note:"
    input = gets.chomp
    contact = @contacts.find(id).first
    contact.note = input
  end

end

