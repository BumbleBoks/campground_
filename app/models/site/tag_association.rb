class Site::TagAssociation < ActiveRecord::Base
  belongs_to :tag, class_name: "Site::Tag", foreign_key: "tag_id",
    inverse_of: :tag_associations
  belongs_to :taggable, foreign_key: "taggable_id", polymorphic: true
  
  validates :tag_id,  presence: true
  validates :taggable_id,  presence: true
  validates :taggable_type,  presence: true
end
