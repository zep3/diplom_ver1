class Test < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates :name, presence: true

  scope :full, includes(:user,:topic)

  has_attached_file :cover

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

  def Test.old_tests(user_id)
    Test.where('user_id = ? AND updated_at < ?', user_id,
               Time.now.advance(days: -15))
  end
end
