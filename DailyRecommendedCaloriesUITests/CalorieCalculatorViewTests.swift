import XCTest
@testable import DailyRecommendedCalories

class CalorieCalculatorViewTests: XCTestCase {
    func testCalculateCalories() {
        let app = XCUIApplication()
        app.launch()
        
        // let datePicker = app.datePickers.firstMatch // app.datePickers["Birthdate"]
        // datePicker.pickerWheels["2023"].adjust(toPickerWheelValue: "1990")
        
//        sleep(1)
//
//        let predicate = NSPredicate(format: "exists == true")
//        let expectation = expectation(for: predicate, evaluatedWith: app.pickers["Sex"], handler: nil)
//        waitForExpectations(timeout: 5, handler: nil)
//
//        let sexPicker = app.pickers["Sex"]
//        XCTAssertTrue(sexPicker.exists)
//        sexPicker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "female")
        
        // let sexPicker = app.pickers.matching(identifier: "Sex").element
        // XCTAssertTrue(sexPicker.exists)
        // let sexPicker = app.pickers.matching(identifier: "Sex").firstMatch
        // XCTAssert(sexPicker.waitForExistence(timeout: 1000))
        // sexPicker.adjust(toPickerWheelValue: "female")

        let weightTextField = app.textFields["Weight (kg)"]
        weightTextField.tap()
        weightTextField.typeText("60")

        let heightTextField = app.textFields["Height (cm)"]
        heightTextField.tap()
        heightTextField.typeText("170")

        app.buttons["Calculate"].tap()
        
        let recommendedCaloriesLabel = app.staticTexts.matching(identifier: "recommendedCaloriesLabel").firstMatch
        // print(recommendedCaloriesLabel.debugDescription)
        // XCTAssert(recommendedCaloriesLabel.exists)
        XCTAssertEqual(recommendedCaloriesLabel.label, "Recommended daily calorie intake: 2,001 calories")
    }
}
