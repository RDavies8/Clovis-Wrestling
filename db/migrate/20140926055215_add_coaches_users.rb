class AddCoachesUsers < ActiveRecord::Migration
  def change
    admin = User.new(admin: true, first_name: 'Clovis', last_name: 'Admin', username: 'Admin', email: 'admin', city: 'Clovis', state: 'CA', subscription: false)
    admin.password = ('wrest');
    admin.encrypt_password
    admin.save(validate: false)
  end
end
