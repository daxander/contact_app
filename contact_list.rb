require 'csv'
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
    find - Find a contact
    phone - Add a Phone Number to a Contact
    help - Show commands"
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
      when 'phone'
      when 'help'
        ContactList.menu
      else
        puts "That is an invalid command!"
        ContactList.menu
      end
    end

    def self.new_contact
      puts "What is the contact's name?"
      contact_name = self.get_input.to_s
      puts "What is the contact's email?"
      contact_email = self.get_input.to_s
      puts Contact.create(contact_name, contact_email)
    end
end

ContactList.menu_select

