# Diet TODO

## Mobile

- Calendar Picker instead of Yesterday button
- dropdown for Category count might be easier on mobile
- Layout for small form-factor should have "Foods" below Categories

## Time Selection

- <%= form.time_select :time_of_day %>

## Vue SPA

- Edit Today's Plan, Fitness, Notes, Totals
- dropdown for categories might be easier on mobile
  -  `<select>` https://vuejs.org/v2/guide/forms.html#Select-Options
- Delete data-confirm="Are you sure?" happens after $emit(), so doesn't cancel

## Models

* Days
  * Day Categories Target
  * Day Categories Remaining 
- Users (Devise or build?)

## Functionality

- Export to Text
- new Day copies previous Day's settings (such as # Proteins, etc)

## DB

- add an Index for Days by ID

## Issues

- https://diet-devindow.herokuapp.com/days/1 => undefined method `categories' for #<Meal  -  <td class="category"><%= meal.categories[0] %></td>

## Tests

- /today
