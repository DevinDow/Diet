<template>
  <div id="today">
    <Day v-if="day" v-bind:day="day" />
  </div>
</template>

<script>
import Day from './Day.vue'
import * as APIs from './apis.js'
export default {
  components: {
    Day
  },

  data: function () {
    return {
      day: null
    }
  },

  mounted: function () {
    console.log("**App MOUNTED**")
    console.log(this)
    this.fetchToday()
  },

  methods: {
    fetchToday() {
      APIs.fetchToday(this.setDay)
    },

    setDay(day) {
      this.day = day
    }
  }
}
</script>

<style scoped>
</style>
