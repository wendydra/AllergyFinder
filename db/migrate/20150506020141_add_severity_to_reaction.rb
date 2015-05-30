class AddSeverityToReaction < ActiveRecord::Migration
  def change
    add_column :reactions, :severity, :integer
  end
end
