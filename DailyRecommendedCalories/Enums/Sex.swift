enum Sex: String, CaseIterable {
    case male = "male"
    case female = "female"
    
    var factor: Double {
        switch self {
        case .male:
            return 5.0
        case .female:
            return -161.0
        }
    }
}
