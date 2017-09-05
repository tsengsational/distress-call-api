# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fellowships = Fellowship.create(
  [
    {
      name: "Alcoholics Anonymous",
      description: "A fellowship for people dealing with alcoholism.",
      acronym: "AA"
    },
    {
      name: "Al-Anon",
      description: "worldwide fellowship that offers a program of recovery for the families and friends of alcoholics, whether or not the alcoholic recognizes the existence of a drinking problem or seeks help.",
      acronym: "Al-Anon"
    },
    {
      name: "Narcotics Anonymous",
      description: "A fellowship for people dealing with drug and substance addiction.",
      acronym: "NA"
    },
    {
      name: "Sex Addicts Anonymous",
      description: "A fellowship for people dealing with compulsive sexual behavior.",
      acronym: "SAA"
    },
    {
      name: "Overeaters Anonymous",
      description: "A fellowship for people dealing with compulsive eating.",
      acronym: "OA"
    },
    {
      name: "Gamblers Anonymous",
      description: "A fellowship for people dealing with compulsive gamling.",
      acronym: "GA"
    },
    {
      name: "Sex and Love Addicts Anonymous",
      description: "A fellowship for people dealing with compulsive sexual behavior and love addiction.",
      acronym: "SLAA"
    },
    {
      name: "Cocaine Anonymous",
      description: "A fellowship for people dealing with cocaine addiction.",
      acronym: "SAA"
    },{
      name: "Co-Dependents Anonymous",
      description: "A fellowship for people dealing with co-dependency.",
      acronym: "CoDA"
    }
  ]
)

jason = User.create(username: 'jason', password: 'jason', first_name: 'Jason', last_initial: 'T', phone: '240-731-6173')

aa = Fellowship.find_by(acronym: 'AA')
circle = Circle.create(name: 'AA-NYC', user_id: jason.id, fellowship_id: aa.id)

supporters = Supporter.create(
  [
    {
      first_name: "Jane",
      last_initial: "G",
      phone: "240-731-6173"
    },
    {
      first_name: "Tarzan",
      last_initial: "J",
      phone: "555-555-5555"
    },
    {
      first_name: "Steve",
      last_initial: "B",
      phone: "444-444-4444"
    },
  ]
)

circle.supporters << supporters
