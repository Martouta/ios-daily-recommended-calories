enum Goal: String, CaseIterable {
    case lose = "lose"
    case maintain = "maintain"
    case gain = "gain"
    
    var factor: Double {
        switch self {
        case .lose:
            return 0.8
        case .maintain:
            return 1.0
        case .gain:
            return 1.2
        }
    }
}
