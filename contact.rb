class Contact
 
  attr_accessor :name, :email, :list_of_contacts

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  # def to_s
  #   # TODO: return string representation of Contact
  #   "#{@name},#{@email}"
  # end

  def to_array
    [@name, @email]
  end


  ## Class Methods
  class << self
    @@list_of_contacts = CSV.read('contacts.csv')

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_contact = Contact.new(name, email) 
      @@list_of_contacts.each do |row|
        if (row.include?(name) || row.include?(email))
          return "This is a Duplicate Entry!" 
        end
      end
      CSV.open('contacts.csv', 'a') do |row|
      row << new_contact.to_array
      end
      new_contact
    end
 
    def find(search_term)
      # TODO: Will find and return contact by index
      @@list_of_contacts.each_with_index do |row, real_index|
        if (row[0].include?(search_term) || row[1].include?(search_term))
          puts "#{real_index} : #{row[0]} (#{row[1]})" 
        end
        if search_term.to_i == real_index
          puts "#{real_index} : #{row[0]} (#{row[1]})" 
        end
      end
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@list_of_contacts.each_with_index do |row, real_index|
        puts "#{real_index} : #{row[0]} (#{row[1]})"
      end
    end
    
    def show(index)
      # TODO: Show a contact, based on ID
      @@list_of_contacts.each_with_index do |row, real_index|
        if real_index == index 
          puts "#{real_index} : #{row[0]} (#{row[1]})"
          return
        end
      end 
    end
    
  end
 
end