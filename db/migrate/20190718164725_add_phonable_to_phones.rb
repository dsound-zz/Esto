class AddPhonableToPhones < ActiveRecord::Migration[5.2]
  def change
    add_reference :phones, :phonable, polymorphic: true
  end
end
