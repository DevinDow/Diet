<template>
  <tr v-if="editing">
    <form class="meal" @submit.prevent="$emit('update', meal_edit); editing=false" @keydown.esc="editing=false">
      <td><input class="minutes_since_midnight" type="number" v-model="meal_edit.minutes_since_midnight" /></td>
      <input class="foods" ref="foods" v-model="meal_edit.foods" />
      <button type="submit">Submit</button>
      <button type="button" @click="editing=false">Cancel</button>
      <button type="button" @click="$emit('delete', meal_edit)" data-confirm="Are you sure?">Delete</button>
    </form>
  </tr>

  <tr v-else>
    <td class="time">{{ meal.time_string }}</td>
    <td class="foods">{{ meal.foods }}</td>
    <td class="category veggies">{{ meal.categories[0] }}</td>
    <td class="category fruits">{{ meal.categories[1] }}</td>
    <td class="category proteins">{{ meal.categories[2] }}</td>
    <td class="category carbs">{{ meal.categories[3] }}</td>
    <td class="category fats">{{ meal.categories[4] }}</td>
    <td class="category seeds">{{ meal.categories[5] }}</td>
    <td class="category oils">{{ meal.categories[6] }}</td>
    <td><button @click="startEditing">Edit</button></td>
    <td><button @click="$emit('delete', meal)" data-confirm="Are you sure?">Delete</button></td>
  </tr>
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
