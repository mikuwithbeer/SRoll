import Cocoa
import Foundation

struct Input {
    let delay: UInt?

    private func sendKeyPress(keyCode: CGKeyCode) {
        let source = CGEventSource(stateID: .privateState)

        let keyDown = CGEvent(keyboardEventSource: source, virtualKey: keyCode, keyDown: true)
        let keyUp = CGEvent(keyboardEventSource: source, virtualKey: keyCode, keyDown: false)

        keyDown?.post(tap: .cghidEventTap)
        keyUp?.post(tap: .cghidEventTap)
    }

    func send() {
        Thread.sleep(forTimeInterval: Double((self.delay ?? 1000) / 1000))
        self.sendKeyPress(keyCode: 49)
        Thread.sleep(forTimeInterval: 0.05)
        self.sendKeyPress(keyCode: 36)
    }
}
