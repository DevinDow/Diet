function getToken() {
  let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  console.log('token = ' + token)
  return token
}

export function fetchToday(setDay) {
  console.log("fetching Today")
  fetch('/today.json')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
      console.log("fetched Today")
      console.log(data)
      setDay(data)
    });
}

export function fetchMeals(dayID, setMeals) {
  console.log("fetching Meals")
  fetch('/days/'+dayID+'/meals.json')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
      console.log("fetched " + data.length + " Meal(s)")
      console.log(data)
      setMeals(data)
    });
}

export function createMeal(dayID, meal, onMealCreated) {
  console.log("CREATING Meal " + meal.time_string)
  console.log(meal)

  fetch('/days/' + dayID + '/meals.json', 
  {
    method: 'POST',
    body: JSON.stringify({meal: meal}),
    headers: { 
      'Content-Type': 'application/json',
      'X-CSRF-Token': getToken()
    }
  }).then((response) => { 
    console.log(response)
    if (onMealCreated) onMealCreated()
  })
}

export function updateMeal(meal, onMealUpdated) {
  console.log('UPDATING Meal ' + meal.id)

  fetch('/meals/' + meal.id + '.json', 
  {
    method: 'PUT',
    body: JSON.stringify({meal: meal}),
    headers: { 
      'Content-Type': 'application/json',
      'X-CSRF-Token': getToken()
    }
  }).then((response) => { 
    console.log(response)
    if (onMealUpdated) onMealUpdated()
  })
}

export function deleteMeal(id, onMealDeleted) {
  console.log('DELETING Meal ' + id)

  fetch('/meals/' + id + '.json', 
  {
    method: 'DELETE',
    headers: { 
      'Content-Type': 'application/json',
      'X-CSRF-Token': getToken()
    }
  }).then((response) => { 
    console.log(response)
    if (onMealDeleted) onMealDeleted()
  })
}
