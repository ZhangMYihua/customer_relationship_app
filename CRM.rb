require_relative './rolodex.rb'
require_relative './contact.rb'

class CRM
  attr_accessor :name

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contact"
    puts "[4] Display one contact"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "Enter a number:"
  end

  def main_menu
    puts "Welcome to #{@name}"
    
    while true
      print_main_menu
      input = gets.chomp.to_i
      choose_option(input)
      return if input == 7
    end

  end

  def choose_option(option)
    case option
      when 1 then add_contact
      when 2 then modify_contact
      when 3 then display_contacts
      when 4 then find_contact
      when 5 then display_attribute
      when 6 then delete_contact
      when 7
        puts "Goodbye!"
        return
      else
        puts "Incorrect option. Try again!" 
    end
  end

  def add_contact
    puts "Provide Contact Details"

    print "First Name: "
    first_name = gets.chomp

    print "Last Name: " 
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Note: "
    note = gets.chomp

    new_contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(new_contact)
  end

  def display_contact(contact)
    puts "ID: #{contact.id}"
    puts "First Name: #{contact.first_name}"
    puts "Last Name: #{contact.last_name}"
    puts "Email: #{contact.email}"
    puts "Note: #{contact.note}"
  end

  def display_attribute

    while true 
    contacts = @rolodex.find_all_contacts
    puts "Which of the following attributes are you searching for? First name, last name, email or note"
    user_input = gets.chomp

      case user_input
        when "first name"
          contacts.each do |first_name|
            puts "#{first_name.first_name}"
          end
      return
        when "last name"
          contacts.each do |last_name|
            puts "#{last_name.last_name}"
          end
      return
        when "email"
          contacts.each do |email|
            puts "#{email.email}"
          end
      return
        user_input.downcase == "note"
          contacts.each do |note|
            puts "#{note.note}"
          end
      return
        else 
          puts "wrong option, please try again"
      end
    end
  end 

  def display_contacts
    contacts = @rolodex.find_all_contacts
    puts "Here is a list of your contacts"
    contacts.each do |contact|
      display_contact(contact)
    end
  end

  def find_contact
    contact = nil

    while contact == nil
      puts "Which contact would you like to retrieve?"
      print "Contact ID: "
      contact_id = gets.chomp.to_i
      returned_contact = @rolodex.find_contact(contact_id)
        if returned_contact != nil
          display_contact(returned_contact)
          return
        end 
    end
  end

  def delete_contact
    puts "Please provide the ID of the contact you wish to delete: "
    input_id = gets.chomp.to_i
    returned_contact = @rolodex.find_to_delete(input_id)
      if returned_contact != nil
        @rolodex.delete_contact(returned_contact)
      end
  end

#   def display_info(contact)
#     puts "#{contact.first_name}, #{contact.last_name}, #{contact.email}, #{contact.note}"
#   end

end

bitmaker = CRM.new("bitmaker labs CRM")
bitmaker.main_menu







