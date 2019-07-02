# Diet TODO

- Rounding in addition makes 0.25+0.25=0.6
- edit Targets

- Vue's "Yesterday" button should clear all since yesterday might not return anything.
- New Meal needs to use JS to get browser time
- days#show ERB show Remaining

## Time Selection

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
