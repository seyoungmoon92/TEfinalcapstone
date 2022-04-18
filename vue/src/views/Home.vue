<template>
  <body>
    <img class="background" />
    <h1 class="content">Discover Tokyo</h1>
    <router-link
      v-bind:to="{ name: 'landmark-search' }"
      tag="button"
      class="button1 button"
      >Start Your Journey</router-link
    >
  </body>
</template>

<script>
export default {
  name: "home",
};
</script>

<style scoped>
img {
  width: 100%;
}
.background {
  z-index: -1;
  /* The image used */
  display: flex;
  background-image: url("https://images.unsplash.com/photo-1604928141064-207cea6f571f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2128&q=80");

  /* Full height */
  height: 100%;
  width: 100%;
  margin: 0 0 0 0;
  padding: 0 0 0 0;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.content {
  font-size: 4.5rem;
  height: 100%;
  padding: 0;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: 20%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
}
.button {
  background: none;
  /*color: inherit;
  border: none;

  padding: 0;
  font: inherit;
  cursor: pointer;
  outline: inherit;
  font-family: "Roboto Mono";
  font-weight: 550;
  font-size: 2.8rem;
  margin: 0 10px 0;
  border-radius: 5px;
  height: 4%; */
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: 32%;
  left: 50%;
  justify-content: center;
  transform: translate(-50%, -50%);
  z-index: 2;
  font-size: 2.0rem;
}

@import url("https://fonts.googleapis.com/css?family=Sacramento&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap");

h1 {
  font-size: calc(20px + 18vh);
  line-height: calc(20px + 20vh);
  text-shadow: 0 0 5px #f562ff, 0 0 15px #f562ff, 0 0 25px #f562ff,
    0 0 20px #f562ff, 0 0 30px #890092, 0 0 80px #890092, 0 0 80px #890092;
  color: #fccaff;
  /* text-shadow: 0 0 5px #fa92bd, 0 0 15px #fa92bd, 0 0 20px #fa92bd, 0 0 40px #fa92bd, 0 0 60px #ff0000, 0 0 10px #ff006a, 0 0 98px #ff0000; */
  color: #ff006a;
  font-family: "Roboto Mono", cursive;
  text-align: center;
  animation: blink 12s infinite;
  -webkit-animation: blink 12s infinite;
}

@-webkit-keyframes blink {
  20%,
  24%,
  55% {
    color: #111;
    text-shadow: none;
  }

  0%,
  19%,
  21%,
  23%,
  25%,
  54%,
  56%,
  100% {
    /*     color: #fccaff;
    text-shadow: 0 0 5px #f562ff, 0 0 15px #f562ff, 0 0 25px #f562ff,
      0 0 20px #f562ff, 0 0 30px #890092, 0 0 80px #890092, 0 0 80px #890092; */
    text-shadow: 0 0 5px #fa92bd, 0 0 15px #fa92bd, 0 0 20px #fa92bd,
      0 0 40px #fa92bd, 0 0 60px #ff0000, 0 0 10px #fa92bd, 0 0 98px #ff0000;
    color: #ffa9ec;
  }
}

@keyframes blink {
  20%,
  24%,
  55% {
    color: #111;
    text-shadow: none;
  }

  0%,
  19%,
  21%,
  23%,
  25%,
  54%,
  56%,
  100% {
    /*     color: #fccaff;
    text-shadow: 0 0 5px #f562ff, 0 0 15px #f562ff, 0 0 25px #f562ff,
      0 0 20px #f562ff, 0 0 30px #890092, 0 0 80px #890092, 0 0 80px #890092; */
    text-shadow: 0 0 5px #fa92bd, 0 0 15px #fa92bd, 0 0 20px #fa92bd,
      0 0 40px #fa92bd, 0 0 60px #ff0000, 0 0 10px #fa92bd, 0 0 98px #ff0000;
    color: #ffd7f2;
  }
}
* {
  -moz-box-sizing: inherit;
  box-sizing: inherit;
  -webkit-transition-property: all;
  transition-property: all;
  -webkit-transition-duration: 0.6s;
  transition-duration: 0.6s;
  -webkit-transition-timing-function: ease;
  transition-timing-function: ease;
}

.button1 {
  display: inline-block;
  padding: 0.35em 1.2em;
  border: 0.1em solid #ffffff;
  margin: 0 0.3em 0.3em 0;
  border-radius: 0.12em;
  box-sizing: border-box;
  text-decoration: none;
  font-family: "Roboto", sans-serif;
  font-weight: 300;
  color: #ffffff;
  text-align: center;
  transition: all 0.2s;
}
.button1:hover {
  color: #000000;
  background-color: #ffffff;
}
@media all and (max-width: 30em) {
  .button1 {
    display: block;
    margin: 0.4em auto;
  }
}

/* IGNORE ALL THE STYLING BELOW */

.btnfos {
  color: rgb(255, 255, 255);
  cursor: pointer;
  /* display: block; */
  /* font-size: 16px; */
  /* font-weight: 400; */
  line-height: 45px;
  max-width: 39rem;
  margin: 0 auto 2em;
  /* position: relative; */
  text-transform: uppercase;
  vertical-align: middle;
  width: 100%;
}
@media (min-width: 400px) {
  .btnfos {
    display: inline-block;
    margin-right: 2.5em;
  }
  .btnfos:nth-of-type(even) {
    margin-right: 0;
  }
}
@media (min-width: 600px) {
  .btnfos:nth-of-type(even) {
    margin-right: 2.5em;
  }
  .btnfos:nth-of-type(5) {
    margin-right: 0;
  }
}



.btnfos-2 {
  letter-spacing: 0;
}

.btnfos-2:hover,
.btnfos-2:active {
  letter-spacing: 5px;
}

.btnfos-2:after,
.btnfos-2:before {
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  border: 1px solid rgba(255, 255, 255, 0);
  bottom: 0px;
  content: " ";
  display: block;
  margin: 0 auto;
  position: relative;
  -webkit-transition: all 280ms ease-in-out;
  transition: all 280ms ease-in-out;
  width: 0;
}

.btnfos-2:hover:after,
.btnfos-2:hover:before {
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  border-color: #fff;
  -webkit-transition: width 350ms ease-in-out;
  transition: width 350ms ease-in-out;
  width: 70%;
}

.btnfos-2:hover:before {
  bottom: auto;
  top: 0;
  width: 70%;
}
</style>