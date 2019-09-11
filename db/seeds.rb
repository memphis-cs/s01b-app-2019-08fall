# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(email: 'alice@email.com', password: 'password')
user2 = User.create!(email: 'bob@email.com', password: 'password')

qz1 = Quiz.create!(user: user1, title: 'Comp 4081 Basic Concepts', 
  description: 'Covers Vagrant virtual machine usage commands and basic MVC architecture.')

q1 = MultipleChoiceQuestion.create!(quiz: qz1, question: 'What does the M in MVC stand for?', 
  answer: 'Model', distractor_1: 'Media', distractor_2: 'Mode')

q2 = MultipleChoiceQuestion.create!(quiz: qz1, question: 'What does the V in MVC stand for?', 
  answer: 'View', distractor_1: 'Verify', distractor_2: 'Validate')

q3 = MultipleChoiceQuestion.create!(quiz: qz1, question: 'What does the C in MVC stand for?', 
  answer: 'Controller', distractor_1: 'Create', distractor_2: 'Code')

q4 = MultipleChoiceQuestion.create!(quiz: qz1, question: 'What shorthand command is used to start the Rails console?', 
  answer: 'rails c', distractor_1: 'rails s', distractor_2: 'rails g')

q5 = MultipleChoiceQuestion.create!(quiz: qz1, question: 'What shorthand command is used to start the Rails server?', 
  answer: 'rails s', distractor_1: 'rails c', distractor_2: 'rails g')

q6 = MultipleChoiceQuestion.create!(quiz: qz1, question: 'What command is used to reverse a Rails generate command?', 
  answer: 'rails destroy', distractor_1: 'rails delete', distractor_2: 'rails c')
    
q7 = FillBlankQuestion.create!(quiz: qz1, question: 'What console command is used to start a Vagrant virtual machine?',
  answer: 'vagrant up')

q8 = FillBlankQuestion.create!(quiz: qz1, question: 'What console command is used to shutdown a Vagrant virtual machine?',
  answer: 'vagrant halt')

qz2 = Quiz.create!(user: user2, title: 'Git and Github', 
  description: 'Covers Git and Github concepts.')

# qz1.questions.concat([q1,q2,q3,q4,q5,q6,q7])
# qz1.save!

q1 = MultipleChoiceQuestion.create!(quiz: qz2, question: 'What Git command would be used to download a copy of an existing repository from GitHub to your computer?', 
  answer: 'git clone', distractor_1: 'git fork', distractor_2: 'git pull')
    
q2 = FillBlankQuestion.create!(quiz: qz2, question: 'What Git command would be used to create a new branch called "issue-32"?',
  answer: 'git checkout -b issue-32')