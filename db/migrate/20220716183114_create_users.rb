class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end

    User.create(
      name: 'Ruby',
      email: 'rstone@fake.com',
      password: 'password'
    )
  end
end
