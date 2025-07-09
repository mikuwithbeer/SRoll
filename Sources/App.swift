import ArgumentParser

@main
struct SRoll: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sroll",
        abstract: "Command-line tool to play random tracks on Spotify",
        version: "1.0.0"
    )

    @Option(help: "List of playlist names to include (includes everything by default)")
    var include: [String] = []

    func run() throws(AppError) {
        let config = try Config.load()
        let track = try config.pick(include)
        let player = try Player(track, delayInput: config.delay)
        try player.run()
    }
}
