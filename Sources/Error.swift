enum AppError: Error, CustomStringConvertible {
    case configLoadFailed
    case invalidTrackID(String)
    case emptyPlaylist
    case commandRunFailed

    var description: String {
        return switch self {
        case .configLoadFailed:
            "Failed to load configuration file (~/.sroll.json). Please ensure the file exists and is correctly formatted."
        case .invalidTrackID(let track):
            "Invalid track ID: '\(track)'. Please check your playlist entries for errors."
        case .emptyPlaylist:
            "No tracks available to play. Please check your playlists in the configuration file."
        case .commandRunFailed:
            "An internal error occurred while running the command. Please try again or report this issue."
        }
    }
}
