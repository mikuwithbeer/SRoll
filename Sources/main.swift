let data = try Config.load()

let player = try Player(data.select([]))
try player.run()

let input = Input(delay: data.inputDelay)
input.send()
