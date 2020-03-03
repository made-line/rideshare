# OO Ride Share

<!-- Instructors: The checkmarks are already there, so just delete them for any line items that aren't met. -->

## Major Learning Goals/Code Review

<!-- Instructors: Feel free to practice creating specific feedback by referencing a line of code if you'd like. For example, you may say something like "nice custom method in `calculator.rb` line 42." This is optional. -->

| Criteria | yes/no, and optionally any details/lines of code to reference |
| --- | --- |
The code demonstrates individual learning about `Time` and the responsibility of `Trip.from_csv`, and uses `Time.parse` in `Trip.from_csv` | ✔️
The code demonstrates breaking out complex logic in helper methods, such as making a helper method in `Trip` to calculate duration | ✔️
There are tests for the nominal cases for the `Passenger#net_expenditures` and `Passenger#total_time_spent` | ✔️
There is at least one edge case test for either `Passenger#net_expenditures` or `Passenger#total_time_spent` testing if the passenger has no trips | ✔️
Practices inheritance. `Driver` inherits from `CsvRecord`, and implements `from_csv` | ✔️
Employs problem-solving and implements `Driver#average_rating` and `Driver#total_revenue` | ✔️
Implements the `TripDispatcher#request_trip`, which creates an instance of `Trip` with a driver and passenger, adds the new trip to `@trips`, and changes the status of the driver | ✔️
Practices composition. In `TripDispatcher#request_trip`, the driver gets connected to the new trip, the passenger gets connected to the new trip | ✔️
Practices git with at least 10 small commits and meaningful commit messages | ✔️

## Testing Requirements

| Testing Requirement | yes/no |
| --- | --- |
There is reasonable test coverage for wave 1, and all wave 1 tests pass | ✔️
There is reasonable test coverage for wave 2, and all wave 2 tests pass | ✔️
Wave 3: Tests in wave 1 and wave 2 explicitly test that only completed trips should be calculated (and ignore in-progress trips) | ✔️
There is reasonable test coverage for `TripDispatcher#request_trip`, and all tests pass | ✔️

## Overall Feedback

| Overall Feedback | Criteria | yes/no |
| --- | --- | --- |
| Green (Meets/Exceeds Standards) | 8+ in Code Review && 3+ in Functional Requirements | ✔️
| Yellow (Approaches Standards) | 6+ in Code Review && 2+ in Functional Requirements | ✔️
| Red (Not at Standard) | 0-5 in Code Review or 0,1 in Functional Reqs, or assignment is breaking/doesn’t run with less than 5 minutes of debugging | ✔️

<!-- ### Additional Feedback -->

<!-- Instructors, feel free to ignore this section if there's nothing else to add. -->

## Code Style Bonus Awards

<!-- Instructors: Please strike a balance between liberal/stingy with these. These are simply built-in pieces of positive feedback; use this to encourage and push students towards a cleaner code style! -->

Was the code particularly impressive in code style for any of these reasons (or more...?)

| Quality | Yes? |
| --- | --- |
| Perfect Indentation | ✅
| Elegant/Clever | ✅
| Descriptive/Readable | ✅
| Concise | ✅
| Logical/Organized | ✅
