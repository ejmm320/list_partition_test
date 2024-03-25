module ListPartitionable
  extend ActiveSupport::Concern

  class_methods do
    def manage_list_partition_tables_for(*table_names)
      self.list_partition_tables = table_names
    end
  end

  included do
    class_attribute :list_partition_tables, default: []

    after_create :create_list_partition_tables
    after_destroy :drop_list_partition_tables

    private def partition_table_name_for(table_name)
      "#{table_name}_#{number}"
    end

    private def create_list_partition_tables
      list_partition_tables.each do |table_name|
        self.class.connection.execute(
          <<~SQL.squish,
            CREATE TABLE IF NOT EXISTS #{partition_table_name_for(table_name)}
              PARTITION OF #{table_name} FOR VALUES IN (#{number});
          SQL
        )
      end
    end

    private def drop_list_partition_tables
      list_partition_tables.each do |table_name|
        self.class.connection.execute(
          <<~SQL.squish,
            DROP TABLE IF EXISTS #{partition_table_name_for(table_name)};
          SQL
        )
      end
    end
  end
end
