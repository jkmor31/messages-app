# Create Speakers
6.times { Speaker.create!(name: Faker::Movies::StarWars.character) }

# Create Messages
10.times {
  speaker = Speaker.all.sample
  Message.create!(
    title: Faker::Movies::StarWars.call_sign,
    description: Faker::Movies::StarWars.quote,
    tag: Faker::Movies::StarWars.planet,
    thumb: nil,
    video: nil,
    speaker: speaker
  )
}