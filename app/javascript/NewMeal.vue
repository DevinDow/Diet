<template>
  <form v-if="creating" class="meal" @submit.prevent="$emit('create', meal); creating=false" @keydown.esc="creating=false">
    <input class="time" type="number" v-model="meal.minutes_since_midnight" />
    <input class="foods" ref="foods" v-model="meal.foods" autofocus />
    <input class="category veggies" type="number" ref="veggies" v-model="meal.categories[0]" step="0.5" />
    <input class="category fruits" type="number" ref="fruits" v-model="meal.categories[1]" step="0.5" />
    <input class="category proteins" type="number" ref="proteins" v-model="meal.categories[2]" step="0.5" />
    <input class="category carbs" type="number" ref="carbs" v-model="meal.categories[3]" step="0.5" />
    <input class="category fats" type="number" ref="fats" v-model="meal.categories[4]" step="0.5" />
    <input class="category seeds" type="number" ref="seeds" v-model="meal.categories[5]" step="0.5" />
    <input class="category oils" type="number" ref="oils" v-model="meal.categories[6]" step="0.5" />
    <button type="submit">Create</button>
    <button type="button" @click="creating=false">Cancel</button>
  </form>
  <div v-else class="meal">
    <button @click="startCreating">New Meal</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      creating: false,
      meal: {}
    }
  },

  methods: {
    startCreating() {
      this.creating=true
      var date = new Date(Date.now())
      console.log(date.getHours() + ":" + date.getMinutes())
      var minutes_since_midnight = date.getHours() * 60 + date.getMinutes()
      this.meal = { "minutes_since_midnight": minutes_since_midnight, "categories": [0,0,0,0,0,0,0] }
      this.$nextTick(() => this.$refs.foods.focus())
    }
  }
}
</script>

<style scoped>
</style>
