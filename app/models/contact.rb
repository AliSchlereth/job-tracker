class Contact <ActiveRecord::Base
  validates :full_name, presence: true
  validates :email, presence: true
  validates :position, presence: true

  belongs_to :company
end
