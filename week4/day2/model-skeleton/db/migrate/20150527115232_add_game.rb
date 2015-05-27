class AddGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.column :word, :string
      t.column :has_won, :boolean
    end
  end
end

# The above will run the SQL below
# CREATE TABLE game (
#   word STRING,
#   has_won BOOLEAN
# );


# Syntax for reference from APIDock
# You can also use the column types as method calls, rather than calling the column method.
#create_table(:suppliers) do |t|
#  t.string :name, limit: 60
#end
