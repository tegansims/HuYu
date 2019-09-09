Boardcard.destroy_all
Board.destroy_all
Card.destroy_all
Question.destroy_all


Card.create(name: "Alex", hair_color: "black", hair_type: "short", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair: 'moustache')
Card.create(name: "Alfred", hair_color: "ginger", hair_type: "long", gender: "male", hat: false, glasses: false, eye_color: "blue", facial_hair: 'moustache')
Card.create(name: "Anita", hair_color: "blonde", hair_type: "long", gender: "female", hat: false, glasses: false, eye_color: "blue", facial_hair: 'none')
Card.create(name: "Anne", hair_color: "black", hair_type: "curly", gender: "female", hat: false, glasses: false, eye_color: "brown", facial_hair: 'none')
Card.create(name: "Bernard", hair_color: "brunette", hair_type: "short", gender: "male", hat: true, glasses: false, eye_color: "brown", facial_hair: 'none')
Card.create(name: "Bill", hair_color: "ginger", hair_type: "bald", gender: "male", hat: false, glasses: false, eye_color: "green", facial_hair: 'beard')
Card.create(name: "Charles", hair_color: "blonde", hair_type: "short", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair: 'moustache')
Card.create(name: "Claire", hair_color: "ginger", hair_type: "short", gender: "female", hat: true, glasses: true, eye_color: "brown", facial_hair: 'none')

Card.create(name: "Paul", hair_color: "white", hair_type: "short", gender: "male", hat: false, glasses: true, eye_color: "brown", facial_hair:"none")
Card.create(name: "Peter", hair_color: "white", hair_type: "short", gender: "male", hat: false, glasses: false, eye_color: "blue", facial_hair:"none")
Card.create(name: "Philip", hair_color: "black", hair_type: "curly", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair:"beard")
Card.create(name: "Richard", hair_color: "brown", hair_type: "bald", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair:"beard")
Card.create(name: "Robert", hair_color: "brown", hair_type: "short", gender: "male", hat: false, glasses: false, eye_color: "blue", facial_hair:"none")
Card.create(name: "Sam", hair_color: "white", hair_type: "bald", gender: "male", hat: false, glasses: true, eye_color: "brown", facial_hair:"none")
Card.create(name: "Susan", hair_color: "white", hair_type: "long", gender: "female", hat: false, glasses: false, eye_color: "brown", facial_hair:"none")
Card.create(name: "Tom", hair_color: "black", hair_type: "bald", gender: "male", hat: false, glasses: true, eye_color: "blue", facial_hair:"none")

Card.create(name: "David", hair_color: "blonde", hair_type: "short", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair: "beard")
Card.create(name: "Eric", hair_color: "blonde", hair_type: "short", gender: "male", hat: true, glasses: false, eye_color: "brown", facial_hair: "none")
Card.create(name: "Frans", hair_color: "ginger", hair_type: "curly", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair: "none")
Card.create(name: "George", hair_color: "white", hair_type: "short", gender: "male", hat: true, glasses: false, eye_color: "brown", facial_hair: "none")
Card.create(name: "Herman", hair_color: "ginger", hair_type: "bald", gender: "male", hat: false, glasses: false, eye_color: "green", facial_hair: "none")
Card.create(name: "Joe", hair_color: "blonde", hair_type: "curly", gender: "male", hat: false, glasses: true, eye_color: "brown", facial_hair: "none")
Card.create(name: "Maria", hair_color: "brown", hair_type: "long", gender: "female", hat: true, glasses: false, eye_color: "brown", facial_hair: "none")
Card.create(name: "Max", hair_color: "black", hair_type: "curly", gender: "male", hat: false, glasses: false, eye_color: "brown", facial_hair: "moustache")


# Questions
#names
Question.create(attribute_type: 'name', attribute_value: 'Alex')
Question.create(attribute_type: 'name', attribute_value: 'Alfred')
Question.create(attribute_type: 'name', attribute_value: 'Anita')
Question.create(attribute_type: 'name', attribute_value: 'Anne')
Question.create(attribute_type: 'name', attribute_value: 'Bernard')
Question.create(attribute_type: 'name', attribute_value: 'Bill')
Question.create(attribute_type: 'name', attribute_value: 'Charles')
Question.create(attribute_type: 'name', attribute_value: 'Claire')
Question.create(attribute_type: 'name', attribute_value: 'Paul')
Question.create(attribute_type: 'name', attribute_value: 'Peter')
Question.create(attribute_type: 'name', attribute_value: 'Philip')
Question.create(attribute_type: 'name', attribute_value: 'Richard')
Question.create(attribute_type: 'name', attribute_value: 'Robert')
Question.create(attribute_type: 'name', attribute_value: 'Sam')
Question.create(attribute_type: 'name', attribute_value: 'Susan')
Question.create(attribute_type: 'name', attribute_value: 'Tom')
Question.create(attribute_type: 'name', attribute_value: 'David')
Question.create(attribute_type: 'name', attribute_value: 'Eric')
Question.create(attribute_type: 'name', attribute_value: 'Frans')
Question.create(attribute_type: 'name', attribute_value: 'George')
Question.create(attribute_type: 'name', attribute_value: 'Herman')
Question.create(attribute_type: 'name', attribute_value: 'Joe')
Question.create(attribute_type: 'name', attribute_value: 'Maria')
Question.create(attribute_type: 'name', attribute_value: 'Max')

#hair_type
Question.create(attribute_type: 'hair_type', attribute_value: 'short')
Question.create(attribute_type: 'hair_type', attribute_value: 'curly')
Question.create(attribute_type: 'hair_type', attribute_value: 'bald')
Question.create(attribute_type: 'hair_type', attribute_value: 'long')


#hair_color
Question.create(attribute_type: 'hair_color', attribute_value: 'black')
Question.create(attribute_type: 'hair_color', attribute_value: 'brunette')
Question.create(attribute_type: 'hair_color', attribute_value: 'blonde')
Question.create(attribute_type: 'hair_color', attribute_value: 'ginger')
Question.create(attribute_type: 'hair_color', attribute_value: 'white')

# gender
Question.create(attribute_type: 'gender', attribute_value: 'male')
Question.create(attribute_type: 'gender', attribute_value: 'female')

#glasses:

Question.create(attribute_type: 'glasses', attribute_value: true)
Question.create(attribute_type: 'glasses', attribute_value: false)

#facial_hair
Question.create(attribute_type: "facial_hair", attribute_value: "none")
Question.create(attribute_type: "facial_hair", attribute_value: "moustache")
Question.create(attribute_type: "facial_hair", attribute_value: "beard")

#eye_color
Question.create(attribute_type: "eye_color", attribute_value: "brown")
Question.create(attribute_type: "eye_color", attribute_value: "blue")
Question.create(attribute_type: "eye_color", attribute_value: "green")
#hat
Question.create(attribute_type: "hat", attribute_value: true)
Question.create(attribute_type: "hat", attribute_value: false)