class Community::Update < ActiveRecord::Base
  belongs_to :author, 
             class_name: "User"
  
  belongs_to :trail, 
             class_name: "Common::Trail"
  
  validates :content, presence: true,
            length: { maximum: 500 }
  validates :author_id, presence: true
  validates :trail_id, presence: true
  
  default_scope { order('created_at DESC') }
end
