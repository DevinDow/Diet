# Diet

This is a web app for tracking foods eaten based on [BeachBody's 21 Day Fix](https://www.beachbodyondemand.com/blog/21-day-fix-hub-nutrition) portioning system.

## Backend
- Ruby on Rails

## UI
- **Vue** for single-page app at *root*
  - *home#index*
    - App vue
      - APIs.fetchToday()
      - Day vue
        - Meals vue
          - Meal vue
          - NewMeal vue
- other REST routes (*/days*, */meals*, etc) for standard Rails ERB implementation
  - */today* view uses JS to reroute to today's date at */day?date=*

# Development
- Hosted on Heroku
  - commiting to GitHub updates Heroku

## Debugging
- rails s{erver} - http://localhost:3000/
- watch Terminal for debugging Backend
- use Browser Developer Tools {F12} for debugging Vue