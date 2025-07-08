import Foundation

typealias TrackTable = [String: [String]]

struct Config: Decodable {
    let inputDelay: UInt?
    let tracks: TrackTable

    static func load() throws(AppError) -> Self {
        var path = FileManager.default.homeDirectoryForCurrentUser
        path.append(component: ".sroll.json")

        do {
            let data = try Data(contentsOf: path)
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            throw AppError.configLoadFailed
        }
    }

    func select(_ playlists: [String]) throws(AppError) -> String {
        let playlistKeys: [String] =
            if playlists.isEmpty {
                Array(self.tracks.keys)
            } else {
                playlists
            }

        if let randomPlaylist = playlistKeys.randomElement() {
            let tracks = self.tracks[randomPlaylist] ?? []
            if let track = tracks.randomElement() {
                return track
            }
        }

        throw AppError.emptyTracklist
    }
}
