<template>
  <body>
    <img class="background" />
    <h1 class="content">Discover Tokyo</h1>
    <router-link
      v-bind:to="{ name: 'landmark-search' }"
      tag="button"
      class="button1 button"
      >Start Your Journey Here</router-link
    >
    <div class="property-card1">
      <h2>Discover Landmarks</h2>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="120"
        height="120"
        fill="currentColor"
        class="bi bi-pin-map"
        viewBox="0 0 16 16"
      >
        <path
          fill-rule="evenodd"
          d="M3.1 11.2a.5.5 0 0 1 .4-.2H6a.5.5 0 0 1 0 1H3.75L1.5 15h13l-2.25-3H10a.5.5 0 0 1 0-1h2.5a.5.5 0 0 1 .4.2l3 4a.5.5 0 0 1-.4.8H.5a.5.5 0 0 1-.4-.8l3-4z"
        />
        <path
          fill-rule="evenodd"
          d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999z"
        />
      </svg>
      <p>Discover points of interest within the city of Tokyo and its surrounding areas</p>
    </div>
    <div class="property-card2">
      <h2>Create Itineraries</h2>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="120"
        height="120"
        fill="currentColor"
        class="bi bi-journal-text"
        viewBox="0 0 16 16"
      >
        <path
          d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"
        />
        <path
          d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"
        />
        <path
          d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"
        />
      </svg>
      <p>Select landmarks and create your own itineraries</p>
    </div>
    <div class="property-card3">
      <h2>Dive Into Tokyo's History</h2>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 16 16"
        width="120"
        height="120"
        fill="currentColor"
      >
        <path
          d="M5 8.25a.75.75 0 01.75-.75h4a.75.75 0 010 1.5h-4A.75.75 0 015 8.25zM4 10.5A.75.75 0 004 12h4a.75.75 0 000-1.5H4z"
        ></path>
        <path
          fill-rule="evenodd"
          d="M13-.005H3a3 3 0 00-3 3c0 .676.224 1.254.603 1.722.526.65 1.331.783 1.907.783h1.177c-.364.662-.814 1.339-1.287 2.048-.205.309-.414.624-.623.946C.891 9.865 0 11.418 0 13a3 3 0 003 3h10a3 3 0 001.667-5.494.75.75 0 00-.834 1.246A1.5 1.5 0 1111.5 13c0-.642.225-1.347.623-2.136.397-.787.933-1.593 1.501-2.446l.011-.017c.554-.83 1.139-1.709 1.582-2.588.445-.885.783-1.836.783-2.818 0-1.672-1.346-3-3-3zm-10 1.5a1.5 1.5 0 00-1.5 1.5c0 .321.1.569.27.778.097.12.325.227.74.227h7.674A2.737 2.737 0 0110 2.995c0-.546.146-1.059.401-1.5H3zm10 0c.831 0 1.5.662 1.5 1.5 0 .646-.225 1.353-.623 2.143-.398.79-.933 1.595-1.501 2.448l-.017.026c-.552.828-1.134 1.702-1.575 2.576C10.338 11.072 10 12.021 10 13c0 .546.146 1.059.401 1.5H3A1.5 1.5 0 011.5 13c0-1.084.63-2.289 1.537-3.692.177-.274.366-.556.558-.845.632-.948 1.306-1.96 1.773-2.963h6.382a.75.75 0 00.417-1.373c-.444-.298-.667-.656-.667-1.132a1.5 1.5 0 011.5-1.5z"
        ></path>
      </svg>
      <p>Explore each landmark and learn about the history of Tokyo and Japanese culture </p>
    </div>
  </body>
</template>

<script>
export default {
  name: "home",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap");
p {
  margin-top:5px;
  text-align: center;
  position: absolute;
  top: 55%;
  left: 50%;
  transform: translate(-50%, 0%);
  font-size: 1.6rem;
  width: 20rem;
}
svg {
  position: absolute;
  top: 35%;
  left: 50%;
  transform: translate(-50%, -50%);
}
h2 {
  font-family: "Open Sans";
  text-align: center;
  margin-top: 15px;
  font-weight: bold;
  font-size: 2rem;
  text-shadow: 0 0 10px #ff84b7;
}
.property-card1 {
  position: absolute;
  background: rgb(38, 40, 70);
  color: #fccaff;
  /* text-shadow: 0 0 10px #ff84b7; */
  top: 57%;
  left: 12%;
  height: 25em;
  width: 25em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  /* position: relative; */
  margin-bottom: 50px;
  margin-right: 80px;

  -webkit-transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  -o-transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  border-radius: 10px;
  overflow: hidden;
  -webkit-box-shadow: 0px 0px 20px #ffd7ff;
  box-shadow: 10px 10px 20px #fdbbfa;
  z-index: 10;
  transform: translate(0%, -20%);
}
.property-card2 {
  position: absolute;
  background: rgb(38, 40, 70);
  color: #fccaff;
  top: 57%;
  left: 50%;
  height: 25em;
  width: 25em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  /* position: relative; */
  margin-bottom: 50px;
  margin-right: 80px;

  -webkit-transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  -o-transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  border-radius: 10px;
  overflow: hidden;
  -webkit-box-shadow: 0px 0px 20px #ffd7ff;
  box-shadow: 0px 10px 20px #fdbbfa;
  z-index: 10;
  transform: translate(-50%, -20%);
}
.property-card3 {
  position: absolute;
  background: rgb(38, 40, 70);
  color: #fccaff;
  top: 57%;
  left: 80%;
  height: 25em;
  width: 25em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  /* position: relative; */
  margin-bottom: 50px;
  margin-right: 80px;

  -webkit-transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  -o-transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  border-radius: 10px;
  overflow: hidden;
  -webkit-box-shadow: 0px 0px 20px #ffd7ff;
  box-shadow: -10px 10px 20px #fdbbfa;
  z-index: 10;
  transform: translate(-50%, -20%);
}
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
  max-height: 120vh;
}

.content {
  font-size: 4.5rem;
  height: 100%;
  width: 100%;
  padding: 0;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: 20%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2.1;
}
.button {
  background-color: rgba(128, 128, 128, 0.514);
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
  top: 33.7%;
  left: 50%;
  justify-content: center;
  transform: translate(-50%, -50%);
  z-index: 2;
  font-size: 2rem;
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
  animation: blink 5s infinite;
  -webkit-animation: blink 5s infinite;
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
  border-radius: 0.5em;
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

  cursor: pointer;
  /* box-shadow: 8px 8px 2px -2px #fa92bd; */
  /* transition: all 1s ease; */
  /* transform: translateX(-10px); */
}
@media all and (max-width: 30em) {
  .button1 {
    display: block;
    margin: 0.4em auto;
  }
}

/* IGNORE ALL THE STYLING BELOW */
</style>