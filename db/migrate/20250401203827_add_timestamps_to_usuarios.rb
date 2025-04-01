class AddTimestampsToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_timestamps :usuarios, default: -> { 'CURRENT_TIMESTAMP' }, null: false
  end
end
