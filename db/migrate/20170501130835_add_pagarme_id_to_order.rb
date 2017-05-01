class AddPagarmeIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pagarme_id, :integer
  end
end
