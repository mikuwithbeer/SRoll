// The Swift Programming Language
// https://docs.swift.org/swift-book

let data = try Config.load().select([])

let player = Player(data)
print(player.track)
