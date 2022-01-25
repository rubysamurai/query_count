if ActiveRecord::VERSION::STRING.to_f <= 4.2
  class CreateUsers < ActiveRecord::Migration
    def change
      create_table :users do |t|
        t.string :email
        t.string :first_name
        t.string :last_name

        t.timestamps
      end
    end
  end
else
  class CreateUsers < ActiveRecord::Migration[5.0]
    def change
      create_table :users do |t|
        t.string :email
        t.string :first_name
        t.string :last_name

        t.timestamps
      end
    end
  end
end
