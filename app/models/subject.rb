class Subject < ActiveRecord::Base
  validates :name, presence: true
  has_many :topics,->{order("name ASC")}, dependent: :destroy
  attr_reader :test_topic

  def private?
    self.groups.size == 0
  end


  def edit?(u)
    u && u.admin?
  end

  def self.add?(u)
    u && u.admin?
  end
end
