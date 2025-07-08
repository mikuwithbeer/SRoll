enum AppError: Error, CustomStringConvertible {
    case configLoadFailed
    case invalidTrackID(String)
    case emptyTracklist
    case commandRunFailed

    var description: String {
        return switch self {
        case .configLoadFailed:
            "Failed to load config"
        case .invalidTrackID(let track):
            "Invalid track ID [\(track)]"
        case .emptyTracklist:
            "No tracks available to play"
        case .commandRunFailed:
            "Internal command failed to run"
        }
    }
}
