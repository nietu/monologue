class Monologue::User < ActiveRecord::Base
  def self.columns
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default,
      sql_type.to_s, null)
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    validate ? valid? : true
  end
=begin


  has_many :posts

  has_secure_password

  validates_presence_of :password, on: :create
  validates_presence_of :name
  validates :email , presence: true, uniqueness: true


  def can_delete?(user)
    return false if self==user
    return false if user.posts.any?
    true
  end
=end
end
