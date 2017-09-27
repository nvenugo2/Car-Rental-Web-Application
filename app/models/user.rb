class User < ApplicationRecord
  has_many :reservations
  has_many :cars, through: :reservations

  def name
    "#{first_name} #{last_name}"
  end
  has_secure_password

  validates_uniqueness_of :email

  validate :password_complexity

  private

	def password_complexity
	 return if password.nil?

	 if password.size < 8
	   errors.add :password, "Must be at least 8 characters long."
	   return
	 end

	 #required_complexity = 3 # we're actually storing this in the configuration of each customer

	 #if !CheckPasswordComplexityService.new(password, required_complexity).valid?
	 #  errors.add :password, "Your password does not match the security requirements."
	 #end
	end
end
