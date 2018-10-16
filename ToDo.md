# Diet TODO

## Vue SPA

- update Totals on add, delete, modify Meal
- GET /today.json might need to create new Day
  - need to worry about TimeZone
    - JS should pass in browser's current Date Time

## Time Selection

- <select> https://vuejs.org/v2/guide/forms.html#Select-Options

## Models

- Days
  - Day Categories target
- Users (Devise or build?)

## Functionality

- new Day copies previous Day's settings (such as # Proteins, etc)

## DB

- add an Index for Days by ID

## Issues

- https://diet-devindow.herokuapp.com/days/1 => undefined method `categories' for #<Meal  -  <td class="category"><%= meal.categories[0] %></td>
