require_relative 'contact'

class Crm

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then Exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Please enter the ID of the contact you want to modify:"
    id_entered = gets.chomp.to_i
    result = Contact.find(id_entered)

    puts "Below is the list of attributes that can be modified"
    puts "first_name"
    puts "last_name"
    puts "email"
    puts "note"
    puts "Please enter an attribute."
    selected_attribute = gets.chomp

    puts "Enter a new value for the attribute"
    new_value = gets.chomp

    result.each {|account| account.update("#{selected_attribute}", "#{new_value}")}
  end

  def delete_contact

    puts "Enter the id of the contact you want to delete:"
    id_entered = gets.chomp.to_i
    result = Contact.find(id_entered)
    result.each do |account|
      puts "Are you sure you want to delete this account?"
      print "Name: #{account.full_name};" + " "
      print "Email address: #{account.email};" + " "
      print "Note: #{account.note};" + " "
      puts "ID: #{account.id}" + "  "
      puts "Please enter yes or no: "
      answer = gets.chomp
      if answer == "no"
        delete_contact
      else
        account.delete
        puts "Contact is deleted"
      end
    end
  end

  def display_all_contacts
    accounts = Contact.all
    accounts.each do |account|
      print "Name: #{account.full_name};" + " "
      print "Email address: #{account.email};" + " "
      print "Note: #{account.note};" + " "
      puts "ID: #{account.id}" + "  "
    end
  end

  def search_by_attribute
    puts "Below is the list of attributes you can search by"
    puts "first_name"
    puts "last_name"
    puts "email"
    puts "note"
    puts "Please enter an attribute from the list:"
    attribute = gets.chomp
    puts  "Please enter the #{attribute}:"
    value = gets.chomp
    found_accounts = Contact.find_by(attribute, value)
    found_accounts.each do |account|
      print "Name: #{account.full_name};" + " "
      print "Email address: #{account.email};" + " "
      print "Note: #{account.note};" + " "
      puts "ID: #{account.id}" + "  "
    end
  end


end

# a_crm_app = CRM.new
