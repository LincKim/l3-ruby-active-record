require "pry"
require "active_record"

# TODO: CONNECT TO THE DATABASE
ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/school.db"
)
# TODO: CREATE TABLE
create_tm_table=<<-SQL
    CREATE TABLE IF NOT EXISTS mentors
    (id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    UNIQUE(email)
    )
    SQL

    ActiveRecord::Base.connection.execute(create_tm_table)

# TODO: Create class that associates with the db table
class Mentor < ActiveRecord::Base

end

# TODO: VIEW METHODS AVAILABLE FOR TABLE (methods)
puts Mentor.methods

# TODO: COLUMN NAMES (column_names)
pp Mentor.column_names

# TODO: CREATE NEW RECORD (create)
# Mentor.create(name: "Kelvin", email: "kelvin51@gmail.com")

# TODO: VIEW ALL RECORDS (all)
pp Mentor.all

# TODO: FIND BY ID (find)
pp Mentor.find(2) # This method normally only takes in an ID

# TODO: FIND BY GIVEN CONDITIONS (find_by)
pp Mentor.find_by(name: 'Kelvin')

# TODO: UPDATE RECORDS (save)
kelvin = Mentor.find_by(name: 'Kelvin')
kelvin.email = "kelvin1234@gmail.com"
kelvin.save()  # This method is used to update the DB with the new records
