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
}
