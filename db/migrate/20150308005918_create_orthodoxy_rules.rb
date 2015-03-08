class CreateOrthodoxyRules < ActiveRecord::Migration
  def change
    create_table :orthodoxy_rules do |t|
      t.string :field_name
      t.string :validator_class
      t.text :validator_options

      t.timestamps null: false
    end
  end
end
