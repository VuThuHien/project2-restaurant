class Admin < Human
  before_save :downcase_email

  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  has_secure_password

  private
  def downcase_email
    self.email = email.downcase
  end
end
