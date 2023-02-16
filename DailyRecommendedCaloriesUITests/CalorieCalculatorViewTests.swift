import XCTest
@testable import DailyRecommendedCalories

class CalorieCalculatorViewTests: XCTestCase {
    var view: CalorieCalculatorView!

    override func setUp() {
        view = CalorieCalculatorView()
    }

    func testCalculateCalories() {
        print("Starting testCalculateCalories()")
        view.calculateCalories()
        XCTAssertNil(view.recommendedCalories)
        print("View after initial calculateCalories(): \(String(describing: view))")

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let birthdate = dateFormatter.date(from: "1990/01/01")!
        view.birthdate = birthdate
        view.sex = .male
        view.weight = "70"
        view.height = "180"
        view.goal = .maintain
        view.activityLevel = .sedentary
        view.calculateCalories()
        print("View after setting properties and calling calculateCalories(): \(String(describing: view))")

        XCTAssertEqual(view.recommendedCalories, 1998)
    }
}
