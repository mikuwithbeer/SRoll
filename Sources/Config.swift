import Foundation

typealias TrackTable = [String: [String]]

struct Config: Decodable {
    let inputDelay: UInt?
    let tracks: TrackTable

    static func load() throws -> Self {
        var path = FileManager.default.homeDirectoryForCurrentUser
        path.append(component: ".sroll.json")

        let data = try Data(contentsOf: path)
        return try JSONDecoder().decode(Self.self, from: data)
    }

    func select(_ playlists: [String]) -> String {
        let playlistKeys: [String] =
            if playlists.isEmpty {
                Array(self.tracks.keys)
            } else {
                playlists
            }

        if let randomPlaylist = playlistKeys.randomElement() {
            let tracks = self.tracks[randomPlaylist] ?? []
            return tracks.randomElement() ?? ""
        } else {
            return ""
        }
    }
}
