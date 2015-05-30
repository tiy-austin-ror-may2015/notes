require 'securerandom'

STUDENTS = [
  'Cecy Correa',
  'Tiffany Lewis',
  'John Daugherty',

  'Matthew Giardina',
  'Reid Paape',
  'Benjamin Hand',

  'Mike Pitre',
  'Alejandro Reyes',
  'Will Sherman',
  'Wei Xia',
]

chosen_student = STUDENTS[SecureRandom.random_number(STUDENTS.length + 1)]
