// const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    // mode: 'jit',
    purge: ['./src/**/*.{html,css,scss,js,jsx,ts,tsx,vue}', './dist/**/*.html'],
    darkMode: false,
    theme: {
      colors: {
        black: '#0a090c',
        white: '#FFFFFA',
        gray: '#9ca3af',
        transparent: 'transparent',
        primary: '#c471ed',
        secondary: '#f64f59',
        tertiary: '#12c2e9',
      },
      extend: {},
    },
  };