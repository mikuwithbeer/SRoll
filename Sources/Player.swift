import Cocoa
import Foundation

class Player {
    var track: String
    var delay: UInt

    init(_ trackInput: String, delayInput: UInt?) throws(AppError) {
        self.delay = delayInput ?? 1000  // default to 1000 ms

        if trackInput.count == 22 {
            self.track = trackInput  // 22-character track ID
        } else if trackInput.starts(with: "https://open.spotify.com/track") {
            guard let url = URL(string: trackInput) else {
                throw AppError.invalidTrackID
            }

            let pathComponents = url.pathComponents
            guard pathComponents.count >= 3, pathComponents[1] == "track" else {
                throw AppError.invalidTrackID
            }

            self.track = pathComponents[2]  // track ID
        } else {
            throw AppError.invalidTrackID
        }
    }

    func run() throws(AppError) {
        let spotifyURI = "spotify:track:\(self.track)"

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/open")
        process.arguments = [spotifyURI]

        do {
            try process.run()
            process.waitUntilExit()
        } catch {
            throw AppError.commandRunFailed
        }

        let eventSource = CGEventSource(stateID: .combinedSessionState)

        guard
            let spaceDown = CGEvent(
                keyboardEventSource: eventSource, virtualKey: 0x31, keyDown: true),
            let spaceUp = CGEvent(
                keyboardEventSource: eventSource, virtualKey: 0x31, keyDown: false),
            let returnDown = CGEvent(
                keyboardEventSource: eventSource, virtualKey: 0x24, keyDown: true),
            let returnUp = CGEvent(
                keyboardEventSource: eventSource, virtualKey: 0x24, keyDown: false)
        else {
            throw AppError.commandRunFailed
        }

        Thread.sleep(forTimeInterval: Double(self.delay / 1000))  // wait for delay

        // stop if any track is playing
        spaceDown.post(tap: .cghidEventTap)
        spaceUp.post(tap: .cghidEventTap)

        Thread.sleep(forTimeInterval: 0.1)  // small cooldown

        // play the music
        returnDown.post(tap: .cghidEventTap)
        returnUp.post(tap: .cghidEventTap)
    }
}
