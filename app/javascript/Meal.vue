<template>
  <tr v-if="editing">
      <td><input class="minutes_since_midnight" type="number" v-model="meal_edit.minutes_since_midnight" /></td>
      <td><input class="foods" ref="foods" v-model="meal_edit.foods" /></td>
      <td><input class="category veggies" type="number" ref="veggies" v-model="meal_edit.categories[0]" step="0.5" /></td>
      <td><input class="category fruits" type="number" ref="fruits" v-model="meal_edit.categories[1]" step="0.5" /></td>
      <td><input class="category proteins" type="number" ref="proteins" v-model="meal_edit.categories[2]" step="0.5" /></td>
      <td><input class="category carbs" type="number" ref="carbs" v-model="meal_edit.categories[3]" step="0.5" /></td>
      <td><input class="category fats" type="number" ref="fats" v-model="meal_edit.categories[4]" step="0.5" /></td>
      <td><input class="category seeds" type="number" ref="seeds" v-model="meal_edit.categories[5]" step="0.5" /></td>
      <td><input class="category oils" type="number" ref="oils" v-model="meal_edit.categories[6]" step="0.5" /></td>
      <td>
        <button type="submit" @click="$emit('update', meal_edit); editing=false">Submit</button>
        <button type="button" @click="editing=false">Cancel</button>
        <button type="button" @click="$emit('delete', meal_edit)" data-confirm="Are you sure?">Delete</button>
      </td>
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
    <td>
      <button @click="startEditing">Edit</button>
      <button @click="$emit('delete', meal)" data-confirm="Are you sure?">Delete</button>
    </td>
  </tr>
</template>

<script>
export default {
  props: [
    "meal", 
    "onMealUpdated"
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
