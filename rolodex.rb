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
    @contacts.find do |contact|
      contact.id == contact_id
      end
    return nil
  end

  def find_all_contacts
    @contacts
  end

  def delete_contact(contact_id)
    @contacts.find do |contact|
      if contact_id == contact.id
        @contacts.delete(contact)
      end
    end
    return nil
  end


end

