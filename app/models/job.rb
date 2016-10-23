class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments


  def self.sort_by_interest
      jobs = Job.all.group(:level_of_interest)
      byebug
  end


end
