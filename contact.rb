class Contact
 
  attr_accessor :name, :email, :list_of_contacts

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    "#{@name},#{@email}"
  end

  def to_array
    [@name, @email]
  end
  
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_contact = Contact.new(name, email) 
      CSV.open('contacts.csv', 'a') do |csv|
        # customers.array.each do |row_array|
        csv << new_contact.to_array
      end
      new_contact
    end
 
    def find(search_term)
      # TODO: Will find and return contact by index
      counter = 0
      list_of_contacts = CSV.read('contacts.csv')
      list_of_contacts.each do |row|
        counter += 1
        if (row[0].include?(search_term) || row[1].include?(search_term))
          puts "#{counter} : #{row[0]} (#{row[1]})" 
        end
      end
     
    end
 
    def all
      # TODO: Return the list of contacts, as is
      counter = 1
      CSV.foreach('contacts.csv') do |row|
        puts "#{counter} : #{row[0]} (#{row[1]})"
        counter += 1
      end
    end
    
    def show(index)
      # TODO: Show a contact, based on ID
      puts index
      puts index.class
      counter = 1
      CSV.foreach('contacts.csv') do |row|
        if counter == index 
          puts "#{counter} : #{row[0]} (#{row[1]})"
          return
        end
          counter += 1
      end 
    end
    
  end
 
end