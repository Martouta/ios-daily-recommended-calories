import XCTest
@testable import DailyRecommendedCalories

class CalorieCalculatorViewTests: XCTestCase {
    func testCalculateCalories() {
        let app = XCUIApplication()
        app.launch()
        
        let weightTextField = app.textFields["Weight (kg)"]
        weightTextField.tap()
        weightTextField.typeText("60")
        
        let heightTextField = app.textFields["Height (cm)"]
        heightTextField.tap()
        heightTextField.typeText("170")
        
        app.buttons["Calculate"].tap()
        
        let recommendedCaloriesLabel = app.staticTexts.matching(identifier: "recommendedCaloriesLabel").firstMatch
        XCTAssertEqual(recommendedCaloriesLabel.label, "Recommended daily calorie intake: 2,001 calories")
    }
}
