class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(search_id)
    @@contacts.select do |account|
      account.id == search_id
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
      #  self.send "#{attribute}=",  new_value
    if attribute == "first_name"
      @first_name = new_value
    elsif attribute == "last_name"
      @last_name = new_value
    elsif attribute == "email"
      @email = new_value
    elsif attribute == "note"
      @note = new_value
    else
      puts "The attribute does not exist"
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)

    case attribute
    when 'first_name'
      result = @@contacts.select {|contact| contact.first_name == value}
      result.length == 0 ? (puts "Sorry, this #{attribute} does not exist") : (return result.first(1))
    when 'last_name'
      result = @@contacts.select {|contact| contact.last_name == value}
      result.length == 0 ? (puts "Sorry, this #{attribute} does not exist") : (return result.first(1))
    when 'email'
      result = @@contacts.select {|contact| contact.email == value}
      result.length == 0 ? (puts "Sorry, this #{attribute} does not exist") : (return result.first(1))
    when 'note'
      result = @@contacts.select {|contact| contact.note == value}
      result.length == 0 ? (puts "Sorry, this #{attribute} does not exist") : (return result.first(1))
    end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    deleting_id = self.id
    @@contacts.delete_if do |contact|
      contact.id == deleting_id
    end
  end

  # Feel free to add other methods here, if you need them.

end


# contact = Contact.new('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
