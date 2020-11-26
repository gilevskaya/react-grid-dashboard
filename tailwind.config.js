const colors = require("tailwindcss/colors");

module.exports = {
  theme: {
    extend: {
      colors: {
        primary: colors.blue[800],
      },
    },
  },
  variants: {},
  plugins: [],
  purge: {
    content: ["./src/**/*.html", "./src/**/*.re", "./src/**/*.bs.js"],
  },
};
