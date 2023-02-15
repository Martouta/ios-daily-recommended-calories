import XCTest
@testable import DailyRecommendedCalories

class CalorieCalculatorTests: XCTestCase {
    func testAgeCalculation() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let birthdate = dateFormatter.date(from: "1990-01-01")!
        let age = CalorieCalculator.age(birthdate: birthdate)
        XCTAssertEqual(age, 33) // TODO: This hardcoded 33 works now but not in 1 year
    }
    
    func testBMRCalculation() {
        let age = 33
        let sex = "male"
        let weight = 70.0
        let height = 180.0
        let bmr = CalorieCalculator.bmr(age: age, sex: sex, weight: weight, height: height)
        XCTAssertEqual(bmr, 1665.0)
    }
    
    func testCalorieCalculation() {
        let bmr = 1705.0
        let goal = "maintain"
        let activityLevel = "sedentary"
        let calories = CalorieCalculator.calculateCalories(bmr: bmr, goal: goal, activityLevel: activityLevel)
        XCTAssertEqual(calories, 2046)
    }
}
