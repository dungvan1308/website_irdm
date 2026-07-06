/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./apps/**/*.html",
    "./apps/**/*.py",
  ],
  safelist: [
    // Solution card_color gradient classes — stored in DB, cannot be auto-detected by Tailwind
    "from-blue-950", "to-blue-800",
    "from-teal-900", "to-cyan-800",
    "from-purple-900", "to-violet-800",
    "from-amber-950", "to-orange-900",
    "from-emerald-950", "to-teal-900",
    // Responsive layout classes used in audience section strips & detail hero
    "lg:flex-row",
    "lg:w-[55%]",
    "lg:w-[45%]",
    // CTA overlay opacity variants
    "bg-primary-950/40",
    "bg-primary-950/75",
    // CTA heading sizes
    "lg:text-5xl",
    "sm:text-4xl",
    // CTA label colour
    "text-orange-400",
    // CTA layout
    "lg:items-center",
    "lg:justify-between",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50:  '#eff6ff',
          100: '#dbeafe',
          200: '#bfdbfe',
          300: '#93c5fd',
          400: '#60a5fa',
          500: '#3b82f6',
          600: '#2563eb',
          700: '#1d4ed8',
          800: '#1e40af',
          900: '#1e3a8a',
          950: '#172554',
        },
      },
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
