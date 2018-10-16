<template>
  <div class="categories">
    <div>
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
}
</script>

<style scoped>
</style>
