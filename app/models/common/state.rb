class Common::State < ActiveRecord::Base
  
  has_many :trails, 
           class_name: "Common::Trail", 
           foreign_key: "state_id",
           dependent: :destroy
  
  VALID_NAME_REGEX = /\A[A-Za-z]+( |.|\w)*\z/
  validates :name,  presence: true,
            uniqueness: { case_sensitivity: false }
  
end
