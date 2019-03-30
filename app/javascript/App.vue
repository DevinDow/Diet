<template>
  <div id="today">
    <button @click="fetchYesterday">Yesterday</button>
    <Day v-if="day" v-bind:day="day" />
  
    <div>
      6am  = 360 <br/>
      7am  = 420 <br/>
      8am  = 480 <br/>
      9am  = 540 <br/>
      <br/>
      10am = 600 <br/>
      11am = 660 <br/>
      noon = 720 <br/>
      <br/>
      1pm  = 780 <br/>
      2pm  = 840 <br/>
      3pm  = 900 <br/>
      4pm  = 960 <br/>
      5pm  = 1020 <br/>
      <br/>
      6pm  = 1080 <br/>
      7pm  = 1140 <br/>
      8pm  = 1200 <br/>
      9pm  = 1260 <br/>
    </div>
  </div>

</template>

<script>
import Day from 'Day.vue'
import * as APIs from 'apis.js'
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

    fetchYesterday() {
      APIs.fetchYesterday(this.setDay)
    },

    setDay(day) {
      this.day = day
    }
  }
}
</script>

<style scoped>
</style>
