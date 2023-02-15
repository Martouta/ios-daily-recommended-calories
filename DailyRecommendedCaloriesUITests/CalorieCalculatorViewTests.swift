import XCTest
@testable import DailyRecommendedCalories

class CalorieCalculatorViewTests: XCTestCase {
    var view: CalorieCalculatorView!

    override func setUp() {
        view = CalorieCalculatorView()
    }

    func testCalculateCalories() {
        view.calculateCalories()
        XCTAssertNil(view.recommendedCalories)

        view.birthdate = Date()
        view.sex = .male
        view.weight = "70"
        view.height = "1.8"
        view.goal = .maintain
        view.activityLevel = .sedentary
        view.calculateCalories()

        XCTAssertEqual(view.recommendedCalories, 1964)
    }
}
