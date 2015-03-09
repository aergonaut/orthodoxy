class CreateRulesets < ActiveRecord::Migration
  def change
    create_table :rulesets do |t|

      t.timestamps null: false
    end
  end
end
