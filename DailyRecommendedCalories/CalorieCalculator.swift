import Foundation

let GOAL_FACTOR: [String: Double] = [
    "lose": 0.8,
    "maintain": 1.0,
    "gain": 1.2
]

let ACTIVITY_FACTOR: [String: Double] = [
    "sedentary": 1.2,
    "lightly_active": 1.375,
    "moderately_active": 1.55,
    "very_active": 1.725,
    "extra_active": 1.9
]

let SEX_DIFFERENCE_MIFFLIN_JEOR: [String: Double] = [
    "male": 5,
    "female": -161
]

struct CalorieCalculator {
    
    static func age(birthdate: Date) -> Int {
        let ageComponents = Calendar.current.dateComponents([.year], from: birthdate, to: Date())
        return ageComponents.year ?? 0
    }
    
    static func bmr(age: Int, sex: String, weight: Double, height: Double) -> Double {
        (weight * 10) + (height * 6.25) - (Double(age) * 5) + SEX_DIFFERENCE_MIFFLIN_JEOR[sex]!
    }
    
    static func calculateCalories(bmr: Double, goal: String, activityLevel: String) -> Int {
        return Int((bmr * GOAL_FACTOR[goal]! * ACTIVITY_FACTOR[activityLevel]!).rounded())
    }
    
}
