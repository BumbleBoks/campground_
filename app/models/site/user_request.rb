class Site::UserRequest < ActiveRecord::Base  
  VALID_EMAIL_REGEX = /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates :email,  presence: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :token,  presence: true
  validates :request_type,  presence: true

  protected
  # class methods
  def self.generate_new(email, request_type)
    user_request = new
    user_request.email = email
    user_request.token = generate_unique_token
    user_request.request_type = request_type
    user_request
  end

  private

  def self.generate_unique_token
    unique_token = false
    while !unique_token
      token = Digest::SHA2.hexdigest(rand.to_s)
      unique_token = true if Site::UserRequest.find_by(token: token).nil?            
    end    
    token
  end

end
