import Cocoa
import Foundation

class Player {
    var track: String
    var delay: UInt

    init(_ track: String, delay: UInt?) throws(AppError) {
        self.delay = delay ?? 1000

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

    func run() throws(AppError) {
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

        let eventSource = CGEventSource(stateID: .combinedSessionState)

        let spaceDown = CGEvent(keyboardEventSource: eventSource, virtualKey: 49, keyDown: true)
        let spaceUp = CGEvent(keyboardEventSource: eventSource, virtualKey: 49, keyDown: false)
        let returnDown = CGEvent(keyboardEventSource: eventSource, virtualKey: 36, keyDown: true)
        let returnUp = CGEvent(keyboardEventSource: eventSource, virtualKey: 36, keyDown: false)

        Thread.sleep(forTimeInterval: Double(self.delay / 1000))

        spaceDown?.post(tap: .cghidEventTap)
        spaceUp?.post(tap: .cghidEventTap)

        Thread.sleep(forTimeInterval: 0.1)

        returnDown?.post(tap: .cghidEventTap)
        returnUp?.post(tap: .cghidEventTap)
    }
}
