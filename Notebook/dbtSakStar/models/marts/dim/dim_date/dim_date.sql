SELECT *
FROM s3(
  'https://izar.ls.fi.upm.es:30009/sakstar/dim_date.csv',
  'YA9JokyWUb2hFUbKYEEN',
  '0k2ornkQpVTqUrBbOEsEXOnBEEWgJf4AFQOU4O7Y',
  'CSVWithNames'
)