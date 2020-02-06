# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.destroy_all
Player.destroy_all
Room.destroy_all

questions = [
  {
    "question": "What is the state bird of Oregon?",
    "correct_answer": 3,
    "answer_1": "Tufted Puffin",
    "answer_2": "Anna's Hummingbird",
    "answer_3": "Western Meadowlark",
    "answer_4": "White-headed Woodpecker"
  },
  {
    "question": "What year was the very first model of the iPhone released?",
    "correct_answer": 2,
    "answer_1": "2005",
    "answer_2": "2007",
    "answer_3": "2008",
    "answer_4": "2010"
  },
  {
    "question": "Which is NOT a Tom Hank's movie?",
    "correct_answer": 4,
    "answer_1": "Saving Private Ryan",
    "answer_2": "The Green Mile",
    "answer_3": "You've Got Mail",
    "answer_4": "Flight"
  },
  {
    "question": "Who was the 2nd president of the US?",
    "correct_answer": 1,
    "answer_1": "John Adams",
    "answer_2": "George Washington",
    "answer_3": "Thomas Jefferson",
    "answer_4": "Abraham Lincoln"
  },
  {
    "question": "Mick Jagger is in which band?",
    "correct_answer": 2,
    "answer_1": "Pink Floyd",
    "answer_2": "Rolling Stones",
    "answer_3": "The Clash",
    "answer_4": "The Beatles"
  },
  {
    "question": "How many spaces are on a standard Monopoly board?",
    "correct_answer": 4,
    "answer_1": "20",
    "answer_2": "60",
    "answer_3": "80",
    "answer_4": "40"
  },
  {
    "question": "What was the first successful vaccine developed in history?",
    "correct_answer": 2,
    "answer_1": "Scarlet Fever",
    "answer_2": "Smallpox",
    "answer_3": "Cholera",
    "answer_4": "Rabies"
  },
  {
    "question": "In which language was the book 'War and Peace' originally written?",
    "correct_answer": 4,
    "answer_1": "French",
    "answer_2": "English",
    "answer_3": "German",
    "answer_4": "Russian"
  },
  {
    "question": "Adele performed the theme song to which James Bond film?",
    "correct_answer": 1,
    "answer_1": "Skyfall",
    "answer_2": "Quantum of Solace",
    "answer_3": "Casino Royale",
    "answer_4": "From Russia With Love"
  },
  {
    "question": "What is the color of Donald Duck's bowtie?",
    "correct_answer": 4,
    "answer_1": "Blue",
    "answer_2": "Yellow",
    "answer_3": "Green",
    "answer_4": "Red"
  },
  {
    "question": "Which of these NBA franchises has never signed LeBron James?",
    "correct_answer": 1,
    "answer_1": "Boston Celtics",
    "answer_2": "Miami Heat",
    "answer_3": "Los Angeles Laker",
    "answer_4": "Cleveland Cavaliers"
  },
  {
    "question": "Which of these antagonist characters was created by novelist J.K. Rowling?",
    "correct_answer": 4,
    "answer_1": "Lord Farqaad",
    "answer_2": "Darth Vader",
    "answer_3": "Professor Moriarty",
    "answer_4": "Lord Voldemort"
  },
  {
    "question": "Which actress plays a major role on the TV show 'The Big Bang Theory'?",
    "correct_answer": 1,
    "answer_1": "Kaley Cuoco",
    "answer_2": "Portia de Rossi",
    "answer_3": "Sofia Vergara",
    "answer_4": "Emily Deschanel"
  },
  {
    "question": "What funk/soul band was Lionel Richie a member of?",
    "correct_answer": 3,
    "answer_1": "Amigas",
    "answer_2": "Spectrums",
    "answer_3": "Commodores",
    "answer_4": "Ataris"
  },
  {
    "question": "The only planet the has a day longer than its year is?",
    "correct_answer": 2,
    "answer_1": "Jupiter",
    "answer_2": "Venus",
    "answer_3": "Pluto",
    "answer_4": "Uranus"
  },
  {
    "question": "The naturalist responsible for \"The Theory of Evolution by Natural Selection\" is which one of the following?",
    "correct_answer": 3,
    "answer_1": "Issac Newton",
    "answer_2": "Albert Einstein",
    "answer_3": "Charles Darwin",
    "answer_4": "Johannes Kepler"
  },
  {
    "question": "The North Star is which one of the following?",
    "correct_answer": 4,
    "answer_1": "Alpha Centauri",
    "answer_2": "Rigal",
    "answer_3": "Orion",
    "answer_4": "Polaris"
  },
  {
    "question": "All land-dwelling living things depend upon which of the following as the initial source of energy?",
    "correct_answer": 3,
    "answer_1": "Green Plants",
    "answer_2": "Chlorophyll",
    "answer_3": "Sunlight",
    "answer_4": "Producers"
  },
  {
    "question": "A woodpecker can peck how many times per second?",
    "correct_answer": 3,
    "answer_1": "10",
    "answer_2": "40",
    "answer_3": "20",
    "answer_4": "30"
  },
  {
    "question": "It is estimated that millions of trees world wide are accidentally planted by which species",
    "correct_answer": 2,
    "answer_1": "Elephants",
    "answer_2": "Squirrels",
    "answer_3": "Tiger",
    "answer_4": "Hippopotamus"
  },
  {
    "question": "Introduced in New York in 1950 what was the first credit card?",
    "correct_answer": 2,
    "answer_1": "Visa",
    "answer_2": "Diners Club",
    "answer_3": "American Express",
    "answer_4": "Master Card"
  },
  {
    "question": "Which composer wrote The Water Music?",
    "correct_answer": 1,
    "answer_1": "Handel",
    "answer_2": "Mozart",
    "answer_3": "Beethoven",
    "answer_4": "Vivaldi"
  },
  {
    "question": "In which city would you find the International Court of Justice?",
    "correct_answer": 2,
    "answer_1": "Amsterdam",
    "answer_2": "Le Hague",
    "answer_3": "Paris",
    "answer_4": "Berlin"
  },
  {
    "question": "In mythology who fired the arrow that struck Achilles in his heel?",
    "correct_answer": 4,
    "answer_1": "Rome",
    "answer_2": "Athens",
    "answer_3": "Berlin",
    "answer_4": "Paris"
  },
  {
    "question": "Which was the first country to have a public monorail system?",
    "correct_answer": 3,
    "answer_1": "USA",
    "answer_2": "Germany",
    "answer_3": "Japan",
    "answer_4": "England"
  },
  {
    "question": "Which is the world's longest mountain range?",
    "correct_answer": 1,
    "answer_1": "Andes",
    "answer_2": "Himalayas",
    "answer_3": "Rocky Mountains",
    "answer_4": "Akaishi Mountains"
  },
  {
    "question": "Which female actress won the most Oscars?",
    "correct_answer": 4,
    "answer_1": "Jodie Foster",
    "answer_2": "Meryl Streep",
    "answer_3": "Angelina Jolie",
    "answer_4": "Katharine Hepburn "
  },
  {
    "question": "In 1988 Bob Dylan was a member of which supergroup?",
    "correct_answer": 3,
    "answer_1": "The Moving Strawburys",
    "answer_2": "The Adventuring Bilburys",
    "answer_3": "The Traveling Wilburys",
    "answer_4": "The Journeying Blackburys"
  },
  {
    "question": "What was Elvis Presley's middle name?",
    "correct_answer": 2,
    "answer_1": "Moses",
    "answer_2": "Aaron",
    "answer_3": "Adam",
    "answer_4": "Abraham"
  },
  {
    "question": "Which Matrix actor also portrayed the masked vigilantes in the cult classic V for Vendetta?",
    "correct_answer": 3,
    "answer_1": "Kenanu Reeves",
    "answer_2": "Laurence Fishburne",
    "answer_3": "Hugo Weaving",
    "answer_4": "Carrie-Anne Moss"
  },
  {
    "question": "What is the longest that an elephant has lived?",
    "correct_answer": 1,
    "answer_1": "86 Years",
    "answer_2": "49 Years",
    "answer_3": "142 Years",
    "answer_4": "98 Years"
  },
  {
    "question": "How many rings are on the Olympic flag?",
    "correct_answer": 4,
    "answer_1": "Six",
    "answer_2": "Four",
    "answer_3": "Seven",
    "answer_4": "Five"
  },
  {
    "question": "What is the most commonly consumed beverage after water in the world",
    "correct_answer": 3,
    "answer_1": "Milk",
    "answer_2": "Coffee",
    "answer_3": "Tea",
    "answer_4": "Soda"
  },
  {
    "question": "What is the top speed of a bat?",
    "correct_answer": 4,
    "answer_1": "70 mph",
    "answer_2": "100 mph",
    "answer_3": "30 mph",
    "answer_4": "60 mph"
  },
  {
    "question": "How many mosquitoes can a bat eat an hour?",
    "correct_answer": 2,
    "answer_1": "100",
    "answer_2": "1200",
    "answer_3": "1000",
    "answer_4": "987"
  },
  {
    "question": "Where is home to the largest bat colony?",
    "correct_answer": 1,
    "answer_1": "Texas, United States",
    "answer_2": "Fortaleza, Brazil",
    "answer_3": "Delhi, India",
    "answer_4": "Prague, Czech Republic"
  },
  {
    "question": "In darts, what's the most points you can score with a single throw?",
    "correct_answer": 2,
    "answer_1": "35",
    "answer_2": "60",
    "answer_3": "50",
    "answer_4": "40"
  },
  {
    "question": "Which of these animals does NOT appear in the Chinese zodiac?",
    "correct_answer": 1,
    "answer_1": "Bear",
    "answer_2": "Rat",
    "answer_3": "Boar",
    "answer_4": "Dog"
  },
  {
    "question": "How many points is the letter X worth in English-language Scrabble?",
    "correct_answer": 2,
    "answer_1": "5",
    "answer_2": "8",
    "answer_3": "11",
    "answer_4": "12"
  },
  {
    "question": "What is the world’s second tallest mountain?",
    "correct_answer": 2,
    "answer_1": "Kilimanjaro in Japan",
    "answer_2": "Aconcagua in Argentina",
    "answer_3": "Monut McKinley in Alaska",
    "answer_4": "Mount Logan in Canada"
  },
  {
    "question": "What is the world’s largest shark?",
    "correct_answer": 4,
    "answer_1": "Basking Shark",
    "answer_2": "Great White",
    "answer_3": "Pacific Sleeper Shark",
    "answer_4": "Whale Shark"
  },
  {
    "question": "What actress helped develop the radio controlled missile?",
    "correct_answer": 3,
    "answer_1": "Veronica Lake",
    "answer_2": "Elizabeth Taylor",
    "answer_3": "Hedy Lamarr",
    "answer_4": "Marilyn Monroe"
  },
  {
    "question": "Who invented hot cocoa?",
    "correct_answer": 1,
    "answer_1": "The Mayans",
    "answer_2": "The Swiss",
    "answer_3": "The Germans",
    "answer_4": "The Incans"
  },
  {
    "question": "What’s the name of the world’s largest active Geyser?",
    "correct_answer": ,
    "answer_1": "Castle Geyser",
    "answer_2": "Old Faithful",
    "answer_3": "Fly Geyser",
    "answer_4": "Steamboat Geyser"
  }
]

questions.each do |q|
  Question.create!(q)
end
