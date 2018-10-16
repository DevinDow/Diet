<template>
  <div class="meal container">
    <form v-if="editing" class="meal" @submit.prevent="$emit('update', meal_edit); editing=false" @keydown.esc="editing=false">
      <input class="minutes_since_midnight" type="number" v-model="meal_edit.minutes_since_midnight" />
      <input class="foods" ref="foods" v-model="meal_edit.foods" />
      <button type="submit">Submit</button>
      <button type="button" @click="editing=false">Cancel</button>
      <button type="button" @click="$emit('delete', meal_edit)" data-confirm="Are you sure?">Delete</button>
    </form>
    <div v-else>
      <span class="time">{{ meal.time_string }}</span>
      <span class="foods">Foods = {{ meal.foods }}</span>
      <button @click="startEditing">Edit</button>
      <button @click="$emit('delete', meal)" data-confirm="Are you sure?">Delete</button>
    </div>
  </div>
</template>

<script>
export default {
  props: [
    "meal"
  ],

  data: function () {
    return {
      editing: false,
      meal_edit: {}
    }
  },

  methods: {
    startEditing() {
      this.meal_edit = JSON.parse(JSON.stringify(this.$props.meal)) // copy props.meal to meal_edit so we can cancel without modifying props.meal
      this.editing=true;
      this.$nextTick(() => this.$refs.foods.focus())
    }
  }
}
</script>

<style scoped>
</style>
