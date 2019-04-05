class App < ApplicationRecord
    def getNum
        create_table :apps do |t|
            t.string :winNum
            t.timestamps null: false
        end
    end
end
