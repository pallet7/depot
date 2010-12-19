class AddNameValueToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :NameValue, :integer ,:default => 1
  end

  def self.down
    remove_column :products, :NameValue
  end
end
