<template>
  <div class="meals">
    <table>
      <tr>
        <th class="heading">Time</th>
        <th class="category veggies">Veggies</th>
        <th class="category fruits">Fruits</th>
        <th class="category proteins">Proteins</th>
        <th class="category carbs">Carbs</th>
        <th class="category fats">Fats</th>
        <th class="category seeds">Seeds</th>
        <th class="category oils">Oils</th>
        <th class="foods">Foods</th>
      </tr>
      <Meal v-for="meal in meals"
        v-bind:meal="meal"
        v-bind:key="meal.id"
        v-on:update="onUpdateMeal"
        v-on:delete="onDeleteMeal" />
      <tr class="top-border">
        <td class="heading">Totals</td>
        <td class="category veggies total">{{ totals[0] }}</td>
        <td class="category fruits total">{{ totals[1] }}</td>
        <td class="category proteins total">{{ totals[2] }}</td>
        <td class="category carbs total">{{ totals[3] }}</td>
        <td class="category fats total">{{ totals[4] }}</td>
        <td class="category seeds total">{{ totals[5] }}</td>
        <td class="category oils total">{{ totals[6] }}</td>
        <td class="foods">{{ calories[0] }} P={{ calories[4]}}% + {{ calories[1] }} C={{ calories[5]}}% + {{ calories[2] }} F={{ calories[6]}}% = {{ calories[3] }} Calories</td>
      </tr>
      <tr class="top-border">
        <td class="heading">Targets</td>
        <td class="category veggies total">{{ targets[0] }}</td>
        <td class="category fruits total">{{ targets[1] }}</td>
        <td class="category proteins total">{{ targets[2] }}</td>
        <td class="category carbs total">{{ targets[3] }}</td>
        <td class="category fats total">{{ targets[4] }}</td>
        <td class="category seeds total">{{ targets[5] }}</td>
        <td class="category oils total">{{ targets[6] }}</td>
        <td class="foods"></td>
      </tr>
      <tr class="top-border">
        <td class="heading">Remaining</td>
        <td class="category veggies remainder" v-bind:class="{ done: remainders[0]<=0 }">{{ remainders[0] }}</td>
        <td class="category fruits remainder" v-bind:class="{ done: remainders[1]<=0 }">{{ remainders[1] }}</td>
        <td class="category proteins remainder" v-bind:class="{ done: remainders[2]<=0 }">{{ remainders[2] }}</td>
        <td class="category carbs remainder" v-bind:class="{ done: remainders[3]<=0 }">{{ remainders[3] }}</td>
        <td class="category fats remainder" v-bind:class="{ done: remainders[4]<=0 }">{{ remainders[4] }}</td>
        <td class="category seeds remainder" v-bind:class="{ done: remainders[5]<=0 }">{{ remainders[5] }}</td>
        <td class="category oils remainder" v-bind:class="{ done: remainders[6]<=0 }">{{ remainders[6] }}</td>
        <td class="foods"></td>
      </tr>
      <NewMeal v-on:create="onCreateMeal" />
    </table>
  </div>
</template>

<script>
import Meal from 'Meal.vue'
import NewMeal from 'NewMeal.vue'
import * as APIs from 'apis.js'
import { parse } from 'querystring';
export default {
  components: {
    Meal,
    NewMeal
  },

  props: ["day"],

  data: function () {
    return {
      meals: [], 
      totals: [0, 0, 0, 0, 0, 0, 0],
      targets: [4, 3, 4, 3, 1, 1, 3],
      remainders: [0, 0, 0, 0, 0, 0, 0],
      calories: [0, 0, 0, 0]
    }
  },

  mounted: function () {
    console.log("**Meals MOUNTED**")
    console.log(this)
    this.fetchMeals()
  },

  methods: {
    fetchMeals() {
      console.log(this.$props.day)
      if (this.$props.day.id) {
        APIs.fetchMeals(this.$props.day.id, this.setMeals)
      }
    },

    setMeals(meals) {
      this.meals = meals
      this.updateTotals()
    },

    onCreateMeal(meal) {
      console.log("*** onCreateMeal()")
      console.log(meal)
      APIs.createMeal(this.$props.day.id, meal, this.fetchMeals)
    },

    onUpdateMeal(meal) {
      console.log("*** onUpdateMeal()")
      console.log(meal)
      APIs.updateMeal(meal, this.fetchMeals)
    },

    onDeleteMeal(meal) {
      console.log("*** onDeleteMeal()")
      console.log(meal)
      APIs.deleteMeal(meal.id, this.fetchMeals)
    },

    // add up totals and remainders whenever this is called (after Meals are fetched)
    updateTotals() {

      // totals from meals
      this.totals = [0, 0, 0, 0, 0, 0, 0] // Veg, Fruit, Protein, Carbs, Fat, Seeds, Oil
      this.calories = [0, 0, 0, 0, 0, 0, 0] // Protein, Carbs, Fat, Total, %, %, %
      var m
      for (m=0; m<this.meals.length; m++) {
        var meal = this.meals[m]
        var c
        for (c=0; c<=6; c++) {
          this.totals[c] =  (parseFloat(this.totals[c]) + parseFloat(meal.categories[c])).toFixed(1)
        }
      }        

      // remainders from totals and targets
      for (c=0; c<=6; c++) {
        this.remainders[c] =  (parseFloat(this.targets[c]) - parseFloat(this.totals[c])).toFixed(1)
      }

      // calculate calories
      this.calories[0] = this.totals[2] * 150 // Protein
      this.calories[1] = parseFloat(this.totals[1]) * 75 + parseFloat(this.totals[3]) * 110 // Carbs
      this.calories[2] = parseFloat(this.totals[4]) * 130 + parseFloat(this.totals[5]) * 105 + parseFloat(this.totals[6]) * 36 // Fat
      this.calories[3] = parseFloat(this.calories[0]) + parseFloat(this.calories[1]) + parseFloat(this.calories[2]) // Totals
      this.calories[4] = (parseFloat(this.calories[0]) / parseFloat(this.calories[3]) * 100).toFixed(0) // Protein %
      this.calories[5] = (parseFloat(this.calories[1]) / parseFloat(this.calories[3]) * 100).toFixed(0) // Carbs %
      this.calories[6] = (parseFloat(this.calories[2]) / parseFloat(this.calories[3]) * 100).toFixed(0) // Fat %
    }
  }
}
</script>

<style scoped>
</style>
