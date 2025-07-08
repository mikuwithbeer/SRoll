import ArgumentParser

@main
struct Sroll: ParsableCommand {
    @Option(help: "Tracks to include")
    var include: [String] = []

    func run() throws(AppError) {
        let data = try Config.load()

        let player = try Player(data.select(include), delay: data.inputDelay)
        try player.run()
    }
}
