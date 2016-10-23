class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_companies_by_interest
    top_3 = joins(:jobs).group(:name).order("AVG(jobs.level_of_interest) DESC").limit(3).pluck(:name, "AVG(jobs.level_of_interest) AS float")
    top_3.map {|company| [company[0], company[1].to_f]}
  end


end
