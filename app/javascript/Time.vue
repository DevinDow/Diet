<template>
  <div class="time">
    <button @click="pingTime">Ping Time</button>
    Time = 
    <span v-if="pinging">pinging...</span>
  </div>
</template>

<script>
import * as APIs from 'apis.js'
export default {
  mounted: function () {
    console.log("**Time MOUNTED**")
    console.log(this)
  },

  data: function () {
    return {
      pinging: false
    }
  },

  methods: {
    pingTime() {
      console.log("Pinging Time")
      this.pinging = true
      APIs.fetchTime(this.setTime)
    },

    setTime(time) {
      this.pinging = false
    },
  }
}
</script>

<style scoped>
</style>
