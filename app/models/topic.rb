class Topic < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :subject
  has_many :tests,->{order("name ASC")}, dependent: :destroy

  attr_reader :test_topic

  scope :ordering, ->{order(:name)}

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
