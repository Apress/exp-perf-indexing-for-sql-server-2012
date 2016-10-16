--Listing 7-6.  DTA Utility Syntax
dta
[ -? ] |
[
   [ -S server_name[ \instance ] ]
   { { -U login_id [-P password ] } | –E }
   { -D database_name [ ,…n ] }
   [ -d database_name ]
   [ -Tl table_list | -Tf table_list_?le ]
   { -if workload_?le | -it workload_trace_table_name | -ip | -ipf }
   { -ssession_name | -IDsession_ID }
   [ -F ]
   [ -of output_script_?le_name ]
   [ -or output_xml_report_?le_name ]
   [ -ox output_XML_?le_name ]
   [ -rl analysis_report_list [ ,…n ] ]
   [ -ix input_XML_?le_name ]
   [ -A time_for_tuning_in_minutes ]
   [ -n number_of_events ]
   [ -m minimum_improvement ]
   [ -fa physical_design_structures_to_add ]
   [ -? ]
   [ -fp partitioning_strategy ]
   [ -fk keep_existing_option ]
   [ -fx drop_only_mode ]
   [ -B storage_size ]
   [ -c max_key_columns_in_index ]
   [ -C max_columns_in_index ]
   [ -e | -e tuning_log_name ]
   [ -N online_option]
   [ -q ]
   [ -u ]
   [ -x ]
   [ -a ]
]