let data = try Config.load()

let player = try Player(data.select([]), delay: data.inputDelay)
try player.run()
