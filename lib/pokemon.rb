class Pokemon   
    attr_accessor :id, :name, :type, :db
    def initialize(id:,name:,type:,db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
   end

   def self.find(num,db)
    pokemon_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?", num)
    self.new(id:pokemon_by_id[0][0], name: pokemon_by_id[0][1], type: pokemon_by_id [0][2], db: db)
   end
end