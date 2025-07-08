import Foundation

class Player {
    var track: String

    init(_ track: String) throws(AppError) {
        if track.count == 22 {
            self.track = track
        } else if track.starts(with: "https://open.spotify.com/track") {
            guard let url = URL(string: track) else {
                throw AppError.invalidTrackID
            }

            let pathComponents = url.pathComponents
            guard pathComponents.count >= 3, pathComponents[1] == "track" else {
                throw AppError.invalidTrackID
            }

            self.track = pathComponents[2]
        } else {
            throw AppError.invalidTrackID
        }
    }

    func run() throws {
        let command = "/usr/bin/open"
        let args = ["spotify:track:\(self.track)"]

        let process = Process()
        process.executableURL = URL(fileURLWithPath: command)
        process.arguments = args

        do {
            try process.run()
            process.waitUntilExit()
        } catch {
            throw AppError.appRunFailed
        }
    }
}
