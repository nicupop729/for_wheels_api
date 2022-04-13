# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Car.create(
    img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-10.48.37-768x486.png',
    model: 'Aston Martin Valkyrie',
    description: 'Valkyrie, its newest flagship, is a hybrid hypercar powered by an internal combustion engine. A bit of a head-scratcher, the battery pack services the vehicle’s electronics and integrates all relevant sub-systems while the V12 engine does the heavy lifting.',
    price: '$2,300',
)
Car.create(
    img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-10.31.44-768x513.png',
    model: 'McLaren 720S Spider',
    description: 'The latest edition comes in the form of the 720S Spider, a 3,236-lb convertible that boasts 10.4-second quarter miles and perfectly cantilevered dihedral door hinges. Weight is rather important to this English brand, as each of its products is the lightest in their respective segment.',
    price: '3,150'
)
Car.create(
    img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-10.51.02-768x566.png',
    model: 'Maserati Levante Trofeo',
    description: 'The trident-badged SUV’s inauguration occurred in 2016; its latest and most powerful iteration underscores the new V8 engine developed in conjunction with Ferrari engineering and built in its Maranello factory.',
    price: '1,700'
)
Car.create(
    img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-10.55.15-768x579.png',
    model: 'Ferrari 488 Pista',
    description: 'Part of the special series sports car segment, it’s also the vehicle with the highest level of technological transfers from racing. On the other hand, the 488 Pista is simply a significant amending of the 488, unveiled in 2015 and which is itself a heavily revised 458, first introduced 10 years ago.',
    price: '3,490'
)
Car.create(
    img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-11.13.50-768x515.png',
    model: 'Lamborghini Huracán EVO',
    description: 'Typically, supercars end their model cycles much like iPhones, phased out for the newest, fastest, strongest one. Lamborghini undertook a fascinating strategy with its entry-level, biggest-selling, mid-cycle Huracán.',
    price: '2,616'
)
