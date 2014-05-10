require 'digest/sha2'
class User < ActiveRecord::Base

after_destroy :ensure_an_admin_remains
has_many :sessions
validates :name, :presence => true, :uniqueness => true #checkig that he name is present and unique to one user
validates :password, :confirmation => true
attr_accessor :password_confirmation
attr_reader :password
validate :password_must_be_present

def ensure_an_admin_remains
	if User.count.zero?
	raise "last user can't be deleted"
end

def password=(password)
	@password = password
	if password.present?
		generate_salt
		self.hashed_password = self.class.encrypt_password(password, salt)
	end
end

   def authenticates (name, password)
                if user = find_by_name(name)
                        if user.hashed_password == encrypt_password(password, user.salt)
                        user
                        end
                end
        end

        def encrypt_password(password, salt)
                Digest::SHA2.hexdigest(password + "oursite" + salt)
        end





class << self
end



	private
	  def password_must_be_present
	    errors.add(:password, "Missing password" ) unless hashed_password.present?
	  end

	 def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	 end
end
end
