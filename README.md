# Test-Project

## Objective

Create a simple iOS-App which shows a table and two buttons below the table ordered horizontal.
Clicking the left button creates a new producer.
Clicking the right button creates a new consumer.

A producer adds every 3 seconds a new cell in the table.
A consumer removes every 4 seconds a cell from the table.
A created producer/consumer will never be removed and will do its job forever.

The user can create producer or consumer how often he wants by clicking the specified buttons.

For this project use XCode and the language Swift.
For the UI use UITableView with UITableViewCell and UIButtons.
This project should be done in about 2 hours.

## Solution

- When a user presses the Producer or Consumer button, we initial a new Model which is stored in an array in the View Controller. 
- Every new model is initialised with a type of either Producer or Consumer and a timr is set for the specified time.
- When the timer is fired, we will use the delegate protocol to add 1 or subtract 1 from a variable in the View Controller called cellCount.
- Everytime the variable 'cellCount' is updated, th table view's data is reloaded.
- Everytime the users clicks a button, the button titles are updated to show how many Prodcuers and Consumers exist.
- Each new cell added to the table is simply call "Cell (indexPath.row)"
