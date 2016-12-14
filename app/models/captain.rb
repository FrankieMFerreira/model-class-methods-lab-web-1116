require 'pry'
class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.select('captain.name').includes(:boats => :classifications)
   .where({classifications: {name:  'Catamaran'}})
  end

  def self.sailors
    self.select('captain.name').includes(:boats => :classifications)
   .where({classifications: {name:  'Sailboat'}}).uniq
  end

  def self.motorboats
    self.select('captain.name').includes(:boats => :classifications)
   .where({classifications: {name:  'Motorboat'}}).uniq
 end

  def self.talented_seamen
    k = self.sailors.pluck(:id) & self.motorboats.pluck(:id)
    self.where(:id => k)
  end

  def self.non_sailors
    sailors = self.sailors.pluck(:id)
    self.where.not(:id => sailors)
  end


end
