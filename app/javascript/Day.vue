<template>
  <div class="day container">
    <h2><a v-bind:href="'/days/'+day.id">{{ day.day_string }}</a></h2>
    <div class="plan">Plan = {{ day.plan }}</div>
    <div class="fitness">Fitness = {{ day.fitness }}</div>
    <Meals v-bind:day="day" />
    <div class="notes">Notes = {{ day.notes }}</div>
  </div>
</template>

<script>
import Meals from './Meals.vue'
export default {
  components: {
    Meals
  },

  props: ["day"],

  mounted: function () {
    console.log("**Day MOUNTED**")
    console.log(this)
  }
}
</script>

<style scoped>
</style>
