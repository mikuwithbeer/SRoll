import ArgumentParser

@main
struct SRoll: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sroll",
        abstract: "Command-line tool to play random tracks on Spotify",
        version: "1.0.0"
    )

    @Argument(help: "List of playlist names to include.")
    var playlists: [String] = []

    func run() throws(AppError) {
        let config = try Config.load()
        let track = try config.pick(playlists)
        let player = try Player(track, delayInput: config.delay)
        try player.run()
    }
}
