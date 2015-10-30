class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.string	:username
    	t.string	:password
    	t.integer	:user_id

      t.timestamps null: false
    end
  end
end
