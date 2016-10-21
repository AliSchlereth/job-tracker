class Comment <ActiveRecord::Base
  validates :note, presence: true
  belongs_to :job

end
