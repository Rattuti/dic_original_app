const colors = require("tailwindcss/colors")

module.exports = {
  content:[
    './index.html',
    './src/**/*.{html,vue,js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        "vtd-primary": colors.sky, // Light mode Datepicker color
      },
    }
  },
  variants: {
    extend: {},
  },
  plugins: [
  ],
}