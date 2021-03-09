class User < ActiveRecord::Base

  def self.authenticate_with_credentials email, password_digest
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password_digest)
      @user
    else
      nil
    end
  end

  has_secure_password

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { minimum: 4 }

  before_save { self.email.downcase!}

end
