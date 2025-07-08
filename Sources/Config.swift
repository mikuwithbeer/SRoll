import Foundation

typealias Tracks = [String: [String]]

struct Config: Decodable {
    let inputDelay: UInt?
    let tracks: Tracks

    static func load() throws -> Self {
        var path = FileManager.default.homeDirectoryForCurrentUser
        path.append(component: ".sroll.json")

        let data = try Data(contentsOf: path)
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
