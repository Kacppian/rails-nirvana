class User
	attr_accessor :name, :email

	def initialize(attributes = {})
		@f_name = attributes[:f_name]
		@l_name = attributes[:l_name]
		@email = attributes[:email]
	end

	def full_name
		"#{@f_name} #{@l_name}"
	end

	def alphabetical_name
		"#{@l_name},#{@f_name}"
	end

	def formatted_email
		"#{full_name} #{@email}"
	end
end