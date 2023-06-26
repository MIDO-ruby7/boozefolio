module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/assets/stylesheets/**/*.sass',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/typography'),
    require('daisyui'),
  ],

  theme: {
    extend: {
      fontFamily: {
        noto: ['Noto Serif JP', 'serif'],
        zen: ['Zen Maru Gothic', 'sans-serif'],
      },
    },
  },

  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#fde047",
          "secondary": "#34d399",
          "accent": "#f87171",
          "neutral": "#4b5563",
          "base-100": "#fdfcfd",
          "info": "#c7d2fe",
          "success": "#bbf7d0",
          "warning": "#fde68a",
          "error": "#fda4af",
        },
      },
    ],
  },
}
