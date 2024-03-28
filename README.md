# README
This Repo was created to test Postgresql list-partition method.

## Sources: 
- https://waymondo.com/posts/postgresql-native-list-partitioning-in-rails/
- https://hackernoon.com/postgresql-table-partitioning-boosting-performance-and-management

## Versions:
- Rails >= 7.1 (Composite Primary Keys are supported -> https://edgeguides.rubyonrails.org/active_record_composite_primary_keys.html)
- Postgresql >= 14

## Comparison:
- With List-Partition:
  
  <img width="463" alt="SELECT" src="https://github.com/ejmm320/list_partition_test/assets/823012/508ac39b-2f74-41a4-a4b7-41d872013223">
  
  <img width="490" alt="sql_partition_3" src="https://github.com/ejmm320/list_partition_test/assets/823012/454b9dba-ab66-417a-b787-40994c62d3a8">

  

- Without List-Partition:
  
  <img width="458" alt="sql_partition_2" src="https://github.com/ejmm320/list_partition_test/assets/823012/9b1d3b8f-76af-4659-b301-8481dba79cee">
  
  <img width="485" alt="sql_partition_4" src="https://github.com/ejmm320/list_partition_test/assets/823012/57d654c8-c1c2-4995-b10a-e6550e3dbd35">
