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


end

