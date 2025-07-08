import Foundation

struct Config: Decodable {
    /// Input delay before playback in milliseconds.
    let delay: UInt?
    /// All playlists and their tracks.
    let playlist: [String: [String]]

    /// Reads ~/.sroll.json and decodes it.
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

    /// Picks a random track from the given playlists.
    func pick(_ playlists: [String]) throws(AppError) -> String {
        // picks from all available ones if list is empty
        let keysToPickFrom = playlists.isEmpty ? Array(self.playlist.keys) : playlists

        guard
            let selectedPlaylist = keysToPickFrom.randomElement(),  // pick a playlist
            let trackList = self.playlist[selectedPlaylist],  // get all tracks from playlist
            let selectedTrack = trackList.randomElement()  // pick a track
        else {
            throw AppError.emptyTracklist
        }

        return selectedTrack
    }
}
