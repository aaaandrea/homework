module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
    has_many :toys, through: :toyable
  end

  def receive_toy(name)
    self.joins(:toys).where('toys.toyable_id' => :toy)
  end
end
