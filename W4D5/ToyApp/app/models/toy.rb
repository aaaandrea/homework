class Toy < ActiveRecord::Base
  validates :name, :toyable, uniqueness: true
  belongs_to :toyable, polymorphic: true
end
