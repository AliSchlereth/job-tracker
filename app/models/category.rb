class Category < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :job
end
