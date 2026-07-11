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
    // Knowledge module — article card text clamping
    "line-clamp-2",
    "line-clamp-3",
    // Knowledge module — filter bar
    "scrollbar-hide",
    "flex-nowrap",
    // Knowledge module — aspect ratios
    "aspect-[4/3]",
    "aspect-[16/9]",
    // Knowledge module — backdrop
    "backdrop-blur-sm",
    // Hero section — Figma exact values (arbitrary classes not in template scan)
    "font-utm-banque",
    "text-[40px]",
    "lg:text-[48px]",
    "leading-[1.5]",
    "lg:leading-[72px]",
    "tracking-[0px]",
    "text-[#094977]",
    "text-[#EC6D29]",
    "min-h-[864px]",
    "max-w-[1440px]",
    "lg:px-20",
    "sm:px-10",
    "lg:py-[160px]",
    "sm:py-28",
    "py-20",
    // Quote strip — Figma exact values
    "font-display",
    "text-[18px]",
    "leading-7",
    "text-[#1565C0]",
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
        brand: {
          dark:   '#094977',
          accent: '#EC6D29',
        },
      },
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'],
        display: ['-apple-system', 'BlinkMacSystemFont', 'SF Pro Display', 'Inter', 'ui-sans-serif', 'sans-serif'],
        'utm-banque': ['"UTM Banque"', 'Inter', 'ui-sans-serif', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
