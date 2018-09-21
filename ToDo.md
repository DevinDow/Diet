# Diet TODO

### Models
- Users (Devise or build?)
- Days
  - Date
  - Plan (string)
  - Goal (array?)
  - Meals
    - Time
    - Foods
    - Categories (array?)
  - Fitness (text?)
  - Notes (test?)
  - Meds
    - Time
    - text
  - BMs

#### Consider
- Categories (Vegs, Fruits, Proteins, Carbs, Fats, Seeds&Dressings, Oils&NutButters, Water) stored as ([serialize array?](https://stackoverflow.com/questions/23340222/how-to-save-array-to-database-in-rails))

### Functionality
- new Day copies previous Day's settings (such as # Proteins, etc)
