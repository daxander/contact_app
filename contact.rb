class Contact
 
  attr_accessor :name, :email, :phone_numbers

  def initialize(name, email, phone_numbers)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @phone_numbers = phone_numbers
  end
 
  def to_s
    # TODO: return string representation of Contact
    message = "#{@name}, #{@email}"
    phone_numbers.each do |phone|
      message << phone.to_s
    end
    message
  end

  # def to_array
  #   [@name, @email, @phone_numbers]
  # end
  
  ## Class Methods
  class << self

    def init
      @@list_of_contacts = []

      CSV.readlines('contacts.csv').each do |row|
        phones = []
        name = row[0]
        email = row[1]
        row[2..-1].each do |phone|
          @parts = phone.split(":")
          type = @parts[0]
          digits = @parts[1]
          phones << PhoneNumber.new(type, digits)
        end
        @@list_of_contacts << Contact.new(name, email, phones)
      end
    end


    def create(name, email, phone_numbers=[])
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_contact = Contact.new(name, email, phone_numbers) 
      @@list_of_contacts.each do |row|
        if (row.include?(name) || row.include?(email))
          return "This is a Duplicate Entry!" 
        end
      end
      CSV.open('contacts.csv', 'a') do |row|
        line = []
        line << new_contact.name
        line << new_contact.email
        new_contact.phone_numbers.each do |ph|
          line << "#{ph.type}:#{ph.digits}"
        end
      row << line
      end
      new_contact
    end
 
    def find(search_term)
      # TODO: Will find and return contact by index
      line = []
      @@list_of_contacts.each_with_index do |row, real_index|
        if (row.name.include?(search_term) || row.email.include?(search_term))
          line << "#{real_index} : #{row}" 
        end
      end
      line
    end
 
    def all
      line = []
      @@list_of_contacts.each_with_index do |row, real_index|
        line << "#{real_index} : #{row}"
      end
      line
    end
    
    def show(index)
      # TODO: Show a contact, based on ID
      @@list_of_contacts.each_with_index do |row, real_index|
        if real_index == index 
          puts "#{real_index} : #{row}"
          return
        end
      end 
    end
    
  end
 
end