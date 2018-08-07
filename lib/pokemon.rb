require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

@@all = []

 def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end

 def self.find(id, db)
   found = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
   lost = []
   lost = found.flatten
   binding.pry
   Pokemon.new(lost[0], lost[1], lost[2], db)
 end
 # what we are going want to do is create a sql query by id and
 # store that array that we get as a result of the query into a variable

end
