class AddParamsToUsers < ActiveRecord::Migration[5.1]
  def change
		add_column :users, :section, :string
		add_column :users, :birthday_date, :string
  end
end
