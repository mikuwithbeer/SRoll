import Foundation

class Player {
    var track: String

    init(_ track: String) {
        guard let url = URL(string: track) else {
            self.track = track
            return
        }

        let hostName = url.host()
        let pathComponents = url.pathComponents

        guard
            hostName == "open.spotify.com",
            pathComponents.count >= 3,
            pathComponents[1] == "track"
        else {
            self.track = track
            return
        }

        self.track = pathComponents[2]
    }

    func run() throws {
        let command = "/usr/bin/open"
        let args = ["spotify:track:\(self.track)"]

        let process = Process()
        process.executableURL = URL(fileURLWithPath: command)
        process.arguments = args

        try process.run()
        process.waitUntilExit()
    }
}
