import Foundation

struct CalorieCalculator {
    static func age(birthdate: Date) -> Int {
        let ageComponents = Calendar.current.dateComponents([.year], from: birthdate, to: Date())
        return ageComponents.year ?? 0
    }
    
    static func bmr(age: Int, sex: Sex, weight: Double, height: Double) -> Double {
        (weight * 10) + (height * 6.25) - (Double(age) * 5) + sex.factor
    }
    
    static func calculateCalories(bmr: Double, goal: Goal, activityLevel: ActivityLevel) -> Int {
        return Int((bmr * goal.factor * activityLevel.factor).rounded())
    }
}
