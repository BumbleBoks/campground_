class Site::Tag < ActiveRecord::Base
  validates :name, presence: true,                
            format: { with: /\A[a-zA-Z]+\z/ },
            length: { maximum: 20 },
            uniqueness: { case_sensitive: false }
  
  before_save { name.downcase! }
end
