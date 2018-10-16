<template>
  <div class="day container">
    <h2><a v-bind:href="'/days/'+day.id">{{ day.day_string }}</a></h2>
    <div class="plan">Plan = {{ day.plan }}</div>
    <div class="fitness">Fitness = {{ day.fitness }}</div>
    <Meal v-for="meal in meals"
      v-bind:meal="meal"
      v-bind:key="meal.id"
      v-on:update="onUpdateMeal"
      v-on:delete="onDeleteMeal" />
    <NewMeal v-on:create="onCreateMeal" />
    <div class="notes">Notes = {{ day.notes }}</div>
  </div>
</template>

<script>
import Meal from './Meal.vue'
import NewMeal from './NewMeal.vue'
import * as APIs from './apis.js'
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
    console.log("**Day MOUNTED**")
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
