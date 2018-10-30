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
      <tr>
        <td class="heading">Totals</td>
        <td class="category veggies total">{{ totals[0] }}</td>
        <td class="category fruits total">{{ totals[1] }}</td>
        <td class="category proteins total">{{ totals[2] }}</td>
        <td class="category carbs total">{{ totals[3] }}</td>
        <td class="category fats total">{{ totals[4] }}</td>
        <td class="category seeds total">{{ totals[5] }}</td>
        <td class="category oils total">{{ totals[6] }}</td>
        <td class="foods"></td>
      </tr>
      <tr>
        <td class="heading">Remaining</td>
        <td class="category veggies remainder">{{ remainders[0] }}</td>
        <td class="category fruits remainder">{{ remainders[1] }}</td>
        <td class="category proteins remainder">{{ remainders[2] }}</td>
        <td class="category carbs remainder">{{ remainders[3] }}</td>
        <td class="category fats remainder">{{ remainders[4] }}</td>
        <td class="category seeds remainder">{{ remainders[5] }}</td>
        <td class="category oils remainder">{{ remainders[6] }}</td>
        <td class="foods"></td>
      </tr>
    </table>
    <NewMeal v-on:create="onCreateMeal" />
  </div>
</template>

<script>
import Meal from 'Meal.vue'
import NewMeal from 'NewMeal.vue'
import * as APIs from 'apis.js'
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
      remainders: [0, 0, 0, 0, 0, 0, 0]
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
      this.totals = [0, 0, 0, 0, 0, 0, 0]
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
    }
  }
}
</script>

<style scoped>
</style>
