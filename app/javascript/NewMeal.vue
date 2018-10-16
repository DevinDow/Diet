<template>
  <form v-if="creating" class="meal" @submit.prevent="$emit('create', meal); creating=false" @keydown.esc="creating=false">
    <input class="minutes_since_midnight" type="number" v-model="meal.minutes_since_midnight" />
    <input class="foods" ref="foods" v-model="meal.foods" autofocus />
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
      this.meal = {priority: 1}
      this.$nextTick(() => this.$refs.foods.focus())
    }
  }
}
</script>

<style scoped>
</style>
