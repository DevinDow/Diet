# Diet TODO

- New Meal needs to use JS to get browser time

## Time Selection

- <%= form.time_select :time_of_day %>

## Vue SPA

- Edit Today's Plan, Fitness, Notes, Totals
- dropdown for categories might be easier on mobile
  -  `<select>` https://vuejs.org/v2/guide/forms.html#Select-Options
- Delete data-confirm="Are you sure?" happens after $emit(), so doesn't cancel

## Mobile

- Calendar Picker instead of Yesterday button
- dropdown for Category count might be easier on mobile
- Layout for small form-factor should have "Foods" below Categories

## Functionality

- Export to Text
- new Day copies previous Day's settings (such as # Proteins, etc)

## DB

- add an Index for Days by ID

## Models

- Users (Devise or build?)

## Tests

- /today
