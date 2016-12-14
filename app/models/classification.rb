class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all
  end

  def self.longest
    # self.joins(:boats).order('length DESC').limit(2)
    # This is not correct, only pulls the qualifications
    # of the first two boats
    Boat.order('length DESC').first.classifications
  end




end
