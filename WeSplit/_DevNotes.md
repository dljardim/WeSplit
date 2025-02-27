#  <#Title#>

Use Cases for WeSplit App

1. Basic Bill Splitting
Actor: User
Description: The user enters a total bill amount and selects the number of people sharing the bill.
Outcome: The app calculates the amount each person needs to pay without tip.
2. Bill Splitting with Tip Calculation
Actor: User
Description: The user enters the bill amount, selects the number of people, and chooses a tip percentage.
Outcome: The app calculates and displays the total amount per person, including the tip.
3. Entering Check Amount
Actor: User
Description: The user inputs the total check amount using the TextField.
Outcome: The app stores the entered value, updates the calculations, and displays the correct total per person.
4. Selecting the Number of People
Actor: User
Description: The user selects how many people are splitting the bill using the Picker.
Outcome: The app updates the per-person amount based on the selected number of people.
5. Choosing a Tip Percentage
Actor: User
Description: The user selects a tip percentage using the segmented Picker.
Outcome: The app recalculates the total bill, including the tip, and updates the amount per person.
6. Adjusting the Tip Percentage Dynamically
Actor: User
Description: When the user changes the tip percentage, the onChange event triggers a recalculation.
Outcome: The new per-person amount is displayed immediately.
7. Handling Edge Cases in Calculation
Actor: System
Description: The app ensures proper handling of edge cases such as:
If the check amount is 0, total per person should be 0.
If the number of people is 1, the total per person should match the full amount (including tip).
If the tip percentage is 0, the calculation should reflect no tip.
Outcome: The app prevents divide-by-zero errors and ensures correct calculations.
8. Using the ‘Done’ Button to Dismiss the Keyboard
Actor: User
Description: If the text field is active, a Done button appears in the toolbar. When pressed, it dismisses the keyboard.
Outcome: The keyboard is hidden, and the user can continue interacting with other elements.
9. Default Currency Formatting
Actor: System
Description: The app automatically formats numbers as currency based on the user’s locale.
Outcome: The check amount and total per person display in the appropriate currency format.
10. Supporting Different Number of People (1-99)
Actor: User
Description: The Picker allows selecting the number of people from 1 to 99.
Outcome: The user can accurately divide the bill among any group size within this range.
11. Persistent State Management for User Input
Actor: System
Description: The app maintains the state of the check amount, number of people, and tip percentage using @State.
Outcome: The values persist as the user interacts with the form.
12. Displaying Dynamic Results in Real-Time
Actor: System
Description: Whenever the user updates the check amount, tip percentage, or number of people, the total per person updates dynamically.
Outcome: The UI instantly reflects changes without requiring a manual refresh.
13. Handling Large Check Amounts
Actor: User
Description: The user enters a large bill amount (e.g., $10,000.00).
Outcome: The app correctly calculates and formats the total per person without UI overflow or misalignment.
14. Resetting Values by Restarting the App
Actor: User
Description: When the user closes and reopens the app, the form resets to its initial values.
Outcome: The app does not persist data between sessions.
15. Accessibility and Usability
Actor: User (including those using assistive technologies)
Description: The app supports accessibility features, such as:
VoiceOver for reading labels and values.
Large, touch-friendly controls.
Outcome: The app remains usable for a wide range of users.

Edge Case Test Scenarios

16. Handling Negative Check Amount
Actor: User
Description: The user attempts to enter a negative value for the check amount.
Expected Outcome: The app should prevent negative values or automatically set them to 0.00.
17. Handling Zero Check Amount
Actor: User
Description: The user enters 0.00 as the check amount.
Expected Outcome: The app should display $0.00 as the total per person, regardless of the selected tip percentage.
18. Handling Zero People Selected
Actor: User
Description: The user tries to select 0 as the number of people (currently prevented by the Picker).
Expected Outcome: Since Picker starts at 1, this scenario shouldn’t occur. However, if modified, the app should prevent division by zero.
19. Handling Non-Numeric Input in Check Amount
Actor: User
Description: The user attempts to enter alphabetic characters or special symbols into the check amount field.
Expected Outcome: The app should ignore non-numeric input and allow only valid decimal numbers.
20. Handling Large Number of People
Actor: User
Description: The user selects 99 people for splitting the bill.
Expected Outcome: The app should still display a correct per-person amount without UI misalignment or rounding errors.
21. Handling Large Tip Percentages
Actor: User
Description: The user manually edits the tip percentage to a value above 100% (modifying the code).
Expected Outcome: The app should restrict tip values to a maximum of 100% or prevent manual entry.
22. Handling Large Monetary Values
Actor: User
Description: The user enters an extremely large check amount (e.g., $1,000,000.00).
Expected Outcome: The app should format and display the value correctly, ensuring calculations don’t cause UI overflow.
23. Handling Rounding Errors in Currency Calculation
Actor: System
Description: The app divides a total bill that results in a repeating decimal (e.g., $10.00 / 3 people).
Expected Outcome: The app should round the per-person amount appropriately based on the currency format.
24. Handling Zero Tip Scenario
Actor: User
Description: The user selects 0% as the tip percentage.
Expected Outcome: The app should display the total per person as the check amount divided by the number of people without adding a tip.
25. Switching Currency Locale
Actor: System
Description: The app runs in a region with a different currency format (e.g., EUR, JPY, GBP).
Expected Outcome: The app should correctly format amounts based on the local currency settings.
26. Switching Between Keyboard and Picker Without Input
Actor: User
Description: The user opens the keyboard for the check amount but does not enter any value, then selects a number of people from the Picker.
Expected Outcome: The app should not crash and should maintain previous valid values.
27. Rapidly Changing Values
Actor: User
Description: The user quickly changes the check amount, number of people, and tip percentage multiple times.
Expected Outcome: The app should handle rapid updates smoothly without UI lag or incorrect calculations.
28. Dismissing Keyboard Midway Through Input
Actor: User
Description: The user partially enters a check amount and then taps "Done" to dismiss the keyboard.
Expected Outcome: The app should retain the entered value and correctly format it.
29. App Restart While Entering Data
Actor: User
Description: The user enters data but force-quits and reopens the app.
Expected Outcome: The app resets to default values (since no persistence is implemented).
30. Changing Tip Percentage Without a Check Amount
Actor: User
Description: The user selects a tip percentage before entering a check amount.
Expected Outcome: The app should not display incorrect values and should wait for a valid check amount.
Additional Enhancements to Consider

Would you like suggestions on improving the UX, such as:
Adding persistence so that data is not lost on app restart?
Using @Binding to share state between multiple views?
Supporting custom tip entry instead of predefined percentages?
