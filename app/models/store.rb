class Store < ApplicationRecord
  include ListPartitionable

  manage_list_partition_tables_for :articles
end
