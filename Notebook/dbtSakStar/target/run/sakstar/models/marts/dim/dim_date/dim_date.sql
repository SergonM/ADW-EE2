
  
    
    
    
        
         


        insert into `adw02_star`.`dim_date`
        ("date_key", "date_actual", "epoch", "day_suffix", "day_name", "day_of_week", "day_of_month", "day_of_quarter", "day_of_year", "week_of_month", "week_of_year", "week_of_year_iso", "month_actual", "month_name", "month_name_abbreviated", "quarter_actual", "quarter_name", "year_actual", "first_day_of_week", "last_day_of_week", "first_day_of_month", "last_day_of_month", "first_day_of_quarter", "last_day_of_quarter", "first_day_of_year", "last_day_of_year", "mmyyyy", "mmddyyyy", "weekend_indr")SELECT *
FROM s3(
  'https://izar.ls.fi.upm.es:30009/sakstar/dim_date.csv',
  'YA9JokyWUb2hFUbKYEEN',
  '0k2ornkQpVTqUrBbOEsEXOnBEEWgJf4AFQOU4O7Y',
  'CSVWithNames'
)
  