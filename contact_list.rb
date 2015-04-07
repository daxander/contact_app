require_relative 'contact'
require_relative 'contact_database'

class ContactList 
    
    @initial_input = ARGV[0]
    @secondary_input = ARGV[1]

    def self.menu
      puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
    end

    def self.input_for_string
      puts "What is the string you want to search for?"
      Contact.find(self.get_input)
    end

    def self.get_input
      STDIN.gets.chomp
    end

    def self.menu_select
      case @initial_input
      when 'new'
        ContactList.new_contact
      when 'list'
        Contact.all
      when 'show'
        Contact.show(@secondary_input.to_i)
      when 'find'
        Contact.find(@secondary_input)
      end
    end

    def self.new_contact
      puts "What is the contact's name?"
      contact_name = self.get_input
      puts "What is the contact's email?"
      contact_email = self.get_input
      puts Contact.create(contact_name, contact_email)
    end
end

ContactList.menu_select

