require_relative 'contact'
require_relative 'rolodex'

class CRM
	attr_accessor :name

	def self.run(name)
		crm = self.new(name)	
		crm.main_menu
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
		puts "Welcome to #{name}"
	end

	def print_main_menu
		puts "[1] Add a new contact"
	  	puts "[2] Modify an existing contact"
	  	puts "[3] Delete a contact"
	  	puts "[4] Display all the contacts"
	  	puts "[5] Display an attribute"
	  	puts "[6] Exit"
	  	puts "Enter a number: "
	end

	def main_menu
		print_main_menu
	  	selection = gets.chomp.to_i
	  	call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_new_contact
		when 2 then modify_contact
		when 3 then delete_contact
		when 4 then display_contacts
		when 5 then display_attribute
		when 6 
			puts "Goodbye!"
			return
		else
			puts "Invalid option. Please try again"
			main_menu
		end
	end

	def add_new_contact
		print "Enter First Name: "
		first_name = gets.chomp
		print "Enter Last Name: "
		last_name = gets.chomp
		print "Enter Email Address: "
		email = gets.chomp
		print "Enter a Note: "
		note = gets.chomp
		@rolodex.add_contact(Contact.new(first_name, last_name, email, note))
		main_menu
	end
end

CRM.run("Bitmaker Labs CRM")


# crm = CRM.new("Bitmaker Labs CRM")
# crm.main_menu














