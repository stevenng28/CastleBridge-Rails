class User < ApplicationRecord
  after_create :generate_user_tokens
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Updates user with new toggle digest
  def generate_token
    self.update_attribute(:toggle_token, User.new_token)
  end
end
