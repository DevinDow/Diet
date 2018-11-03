<template>
  <tr v-if="creating" class="meal">
    <td><input class="time" type="number" v-model="meal.minutes_since_midnight" /></td>
    <td><input class="category veggies" type="number" ref="veggies" v-model="meal.categories[0]" step="0.5" /></td>
    <td><input class="category fruits" type="number" ref="fruits" v-model="meal.categories[1]" step="0.5" /></td>
    <td><input class="category proteins" type="number" ref="proteins" v-model="meal.categories[2]" step="0.5" /></td>
    <td><input class="category carbs" type="number" ref="carbs" v-model="meal.categories[3]" step="0.5" /></td>
    <td><input class="category fats" type="number" ref="fats" v-model="meal.categories[4]" step="0.5" /></td>
    <td><input class="category seeds" type="number" ref="seeds" v-model="meal.categories[5]" step="0.5" /></td>
    <td><input class="category oils" type="number" ref="oils" v-model="meal.categories[6]" step="0.5" /></td>
    <td><input class="foods" ref="foods" v-model="meal.foods" autofocus /></td>
    <td><button type="submit" @click="$emit('create', meal); creating=false">Create</button></td>
    <td><button type="button" @click="creating=false">Cancel</button></td>
  </tr>
  <tr v-else class="meal">
    <button @click="startCreating">New Meal</button>
  </tr>
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
