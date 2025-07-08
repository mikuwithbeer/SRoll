enum AppError: Error, CustomStringConvertible {
    case configLoadFailed
    case invalidTrackID
    case emptyTracklist
    case commandRunFailed

    var description: String {
        return switch self {
        case .configLoadFailed:
            "Failed to load config."
        case .invalidTrackID:
            "Invalid track ID"
        case .emptyTracklist:
            "No tracks available to play."
        case .commandRunFailed:
            "Internal command failed to run."
        }
    }
}
