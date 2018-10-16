<template>
  <div class="meals">
    <table>
      <tr>
        <th class="time">Time</th>
        <th class="foods">Foods</th>
        <th class="category veggies">Veggies</th>
        <th class="category fruits">Fruits</th>
        <th class="category proteins">Proteins</th>
        <th class="category carbs">Carbs</th>
        <th class="category fats">Fats</th>
        <th class="category seeds">Seeds</th>
        <th class="category oils">Oils</th>
      </tr>
      <Meal v-for="meal in meals"
        v-bind:meal="meal"
        v-bind:key="meal.id"
        v-on:update="onUpdateMeal"
        v-on:delete="onDeleteMeal" />
      <td class="time total">TOTALS</td>
      <td class="foods"></td>
      <td class="category veggies total">{{ day.totals[0] }}</td>
      <td class="category fruits total">{{ day.totals[1] }}</td>
      <td class="category proteins total">{{ day.totals[2] }}</td>
      <td class="category carbs total">{{ day.totals[3] }}</td>
      <td class="category fats total">{{ day.totals[4] }}</td>
      <td class="category seeds total">{{ day.totals[5] }}</td>
      <td class="category oils total">{{ day.totals[6] }}</td>
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
      meals: []
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
    }
  }
}
</script>

<style scoped>
</style>
