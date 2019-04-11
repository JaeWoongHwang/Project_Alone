class App < ApplicationRecord
    def getting
        create_table :apps do |a|
            t.string :winNum
            t.timestamps null: false
        end
    end
end
