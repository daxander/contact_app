require 'csv'
require_relative 'contact'
require_relative 'contact_database'
require_relative 'phone_number'

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
        puts Contact.all

      when 'show'
        puts Contact.show(@secondary_input.to_i)
      when 'find'
        puts Contact.find(@secondary_input)
      when 'help'
        ContactList.menu
      else
        puts "That is an invalid command!"
        ContactList.menu
      end
    end

    def self.new_contact
      phone_numbers = []
      puts "What is the contact's name?"
      contact_name = self.get_input.to_s
      puts "What is the contact's email?"
      contact_email = self.get_input.to_s
      puts "Do you want to add a phone number? (yes/no)"
      user_answer = self.get_input
        while user_answer == 'yes'
          puts "Type Phone number Type"
          type = self.get_input
          puts "Type the Phone Number"
          digits = self.get_input
          phone_numbers << PhoneNumber.new(type,digits)
          puts "Do you want to add a phone number? (yes/no)"
          user_answer = self.get_input
        end
      puts Contact.create(contact_name, contact_email, phone_numbers)
    

    end
end

Contact.init
ContactList.menu_select

