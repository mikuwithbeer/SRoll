// The Swift Programming Language
// https://docs.swift.org/swift-book

let data = try Config.load()

let player = Player(data.select([]))
try player.run()

let input = Input(delay: data.inputDelay)
input.send()
