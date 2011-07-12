require 'dm-core'
require 'datamapper/dm-infinispan-adapter'

class Beer

  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :desc,       Text
  property :likes,      Integer
  property :created_at, DateTime
  
  def self.seed
    return nil if count > 0 
    create :name => 'Pisgah Solstice', 
           :description => 'Pisgah’s year round Belgian. A Tripel ale, this beer contains moderately fruity esters with an alcoholic complexity supported ' + 
                           'by a soft malt character. This beer is pale gold in color and 9.5% ABV. (750ml  and draft)',
           :created_at => Time.now

    create :name => 'Catawba White Zombie Ale',
           :description => 'A Belgium white ale made with coriander, orange peel, and wheat. This beer is refreshing and tasty with a sweet and shimmering frothy head.',
           :created_at => Time.now
  end
  
end

DataMapper.setup :default, 
                 :adapter => 'infinispan', 
                 :persist => 'db/infinispan'
                 
DataMapper::Model.raise_on_save_failure = true 
DataMapper.finalize