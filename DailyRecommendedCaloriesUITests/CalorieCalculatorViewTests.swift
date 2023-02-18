import XCTest
import ViewInspector
@testable import DailyRecommendedCalories

class CalorieCalculatorViewTests: XCTestCase {
    func testCalculateCalories() throws {
        let calorieCalculatorView = CalorieCalculatorView()
        
        // Inspect the DatePicker and set the date to "Nov 20, 1992"
        let datePicker = try calorieCalculatorView.inspect().datePicker().picker()
        try datePicker.select(Date(timeIntervalSinceReferenceDate: 0))
        try datePicker.select(date: "Nov 20, 1992")
        
        // Inspect the weight and height text fields and set their values
        let weightField = try calorieCalculatorView.inspect().textField(0)
        try weightField.set("70.0")
        
        let heightField = try calorieCalculatorView.inspect().textField(1)
        try heightField.set("180.0")
        
        // Inspect the Picker views and set their values
        let goalPicker = try calorieCalculatorView.inspect().picker(0).picker()
        try goalPicker.select("Lose")
        
        let activityLevelPicker = try calorieCalculatorView.inspect().picker(1).picker()
        try activityLevelPicker.select("Very Active")
        
        // Tap the calculate button to calculate the recommended calories
        let calculateButton = try calorieCalculatorView.inspect().button()
        try calculateButton.tap()
        
        // Check that the recommended calories value is not nil
        let recommendedCaloriesLabel = try calorieCalculatorView.inspect().text(1)
        XCTAssertNotNil(try recommendedCaloriesLabel.string())
    }
}
