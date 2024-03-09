/** @type {import('tailwindcss').Config} */
var defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  darkMode: "class",
  content: ["../app/view/**/*.{html,js,R}"],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          "var(--font-sans)",
          defaultTheme.fontFamily.sans
        ],
      },
//      colors: {
//        "primary": gigas,
//      }
    }
  }
}
