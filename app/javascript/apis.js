function getToken() {
  let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  console.log('token = ' + token)
  return token
}

export function fetchToday(setDay) {
  console.log("fetching Today")
  var date = new Date(Date.now())
  fetchDate(date, setDay)
}

export function fetchTime(setTime) {
  console.log("fetching Time")
  fetch('/time.json')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
      console.log("fetched Time")
      console.log(data)
    });
}

export function fetchYesterday(setDay) {
  console.log("fetching Yesterday")
  var date = new Date(Date.now())
  date.setDate(date.getDate()-1); // Yesterday = now()'s date - 1
  fetchDate(date, setDay)
}

function fetchDate(date, setDay) {
  console.log("fetching date")
  console.log(date)
  var dateString = `${date.getFullYear()}/${date.getMonth()+1}/${date.getDate()}` // Months are 0-11
  console.log(dateString)
  fetch('/date.json?date='+dateString)
    .then((response) => {
      return response.json()
    })
    .then((data) => {
      console.log("fetched Day")
      console.log(data)
      setDay(data)
    });
}

export function fetchMeals(dayID, setMeals) {
  console.log("fetching Meals for Day #" + dayID)
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
