"""Restore all wiped homepage templates without multi-line {# #} comments."""

import pathlib

BASE = pathlib.Path(__file__).parent.parent

# ─── helper ───────────────────────────────────────────────────────────────────

def write(rel: str, content: str) -> None:
    p = BASE / rel
    p.write_text(content.lstrip("\n"), encoding="utf-8")
    print(f"  wrote {p.stat().st_size:6d}b  {rel}")


# ─── hero.html ────────────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/hero.html", """
{% load i18n %}
<section
  class="relative min-h-screen flex flex-col overflow-hidden"
  aria-label="{% trans 'Hero' %}"
>
  {% if hero and hero.background_image %}
    <div class="absolute inset-0 z-0">
      <img src="{{ hero.background_image.url }}" alt="" class="w-full h-full object-cover object-center" loading="eager" aria-hidden="true" />
    </div>
  {% else %}
    <div class="absolute inset-0 z-0 bg-gradient-to-br from-primary-950 via-primary-900 to-primary-800" aria-hidden="true"></div>
  {% endif %}

  <div class="absolute inset-0 z-10 bg-primary-950/65" aria-hidden="true"></div>

  <div class="absolute inset-0 z-10 opacity-10" aria-hidden="true"
       style="background-image: url('data:image/svg+xml,%3Csvg width=&quot;60&quot; height=&quot;60&quot; viewBox=&quot;0 0 60 60&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;%3E%3Cg fill=&quot;none&quot; fill-rule=&quot;evenodd&quot;%3E%3Cg fill=&quot;%23ffffff&quot; fill-opacity=&quot;0.4&quot;%3E%3Cpath d=&quot;M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z&quot;/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');">
  </div>

  <div class="relative z-20 flex-1 flex items-center">
    <div class="max-w-7xl mx-auto w-full px-4 sm:px-6 lg:px-8 py-32 lg:py-48">
      <div class="max-w-3xl">
        {% if hero %}
          {% if hero.eyebrow_text %}
            <p class="inline-flex items-center gap-3 text-primary-300 text-xs font-semibold uppercase tracking-widest mb-6">
              <span class="w-8 h-px bg-primary-400 flex-shrink-0" aria-hidden="true"></span>
              {{ hero.eyebrow_text }}
            </p>
          {% elif hero.subheading %}
            <p class="inline-flex items-center gap-3 text-primary-300 text-xs font-semibold uppercase tracking-widest mb-6">
              <span class="w-8 h-px bg-primary-400 flex-shrink-0" aria-hidden="true"></span>
              {{ hero.subheading }}
            </p>
          {% endif %}

          <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-white leading-tight mb-6 uppercase">
            {{ hero.heading }}
          </h1>

          {% if hero.description %}
            <p class="text-base sm:text-lg text-white/75 leading-relaxed mb-10 max-w-2xl">{{ hero.description }}</p>
          {% endif %}

          <div class="flex flex-col sm:flex-row gap-4 mb-8">
            {% if hero.primary_cta_label and hero.primary_cta_url %}
              <a href="{{ hero.primary_cta_url }}"
                 class="inline-flex items-center justify-center px-8 py-4 bg-primary-600 hover:bg-primary-500 text-white font-semibold rounded-xl transition-all duration-150 shadow-lg hover:shadow-xl hover:-translate-y-0.5">
                {{ hero.primary_cta_label }}
                <svg class="ml-2 w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                </svg>
              </a>
            {% endif %}
            {% if hero.secondary_cta_label and hero.secondary_cta_url %}
              <a href="{{ hero.secondary_cta_url }}"
                 class="inline-flex items-center justify-center px-8 py-4 border border-white/30 hover:border-white/60 text-white font-semibold rounded-xl transition-all duration-150 hover:bg-white/10 backdrop-blur-sm">
                {{ hero.secondary_cta_label }}
              </a>
            {% endif %}
          </div>

          {% with tags=hero.pill_tags.all %}
            {% if tags %}
              <div class="flex flex-wrap gap-2">
                {% for tag in tags %}
                  <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-white/10 text-white/80 border border-white/20">{{ tag.label }}</span>
                {% endfor %}
              </div>
            {% endif %}
          {% endwith %}

        {% else %}
          <p class="inline-flex items-center gap-3 text-primary-300 text-xs font-semibold uppercase tracking-widest mb-6">
            <span class="w-8 h-px bg-primary-400 flex-shrink-0" aria-hidden="true"></span>
            {% trans "Research · Science · Technology · Innovation" %}
          </p>
          <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-white leading-tight mb-6 uppercase">
            {% trans "Building Solutions from Research, Data and Interdisciplinary Knowledge" %}
          </h1>
          <div class="flex flex-col sm:flex-row gap-4">
            <a href="/giai-phap/"
               class="inline-flex items-center justify-center px-8 py-4 bg-primary-600 hover:bg-primary-500 text-white font-semibold rounded-xl transition-all duration-150">
              {% trans "Explore Solutions" %}
              <svg class="ml-2 w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
              </svg>
            </a>
            <a href="/ve-irdm/"
               class="inline-flex items-center justify-center px-8 py-4 border border-white/30 hover:border-white/60 text-white font-semibold rounded-xl transition-all duration-150 hover:bg-white/10">
              {% trans "View IRDM Capabilities" %}
            </a>
          </div>
        {% endif %}
      </div>
    </div>
  </div>

  {% if hero and hero.quote_strip_text %}
    <div class="relative z-20 bg-primary-900/80 backdrop-blur-sm border-t border-white/10 py-5">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <p class="text-center text-white/90 text-base sm:text-lg font-medium italic">
          &ldquo;{{ hero.quote_strip_text }}&rdquo;
        </p>
      </div>
    </div>
  {% endif %}
</section>
""")


# ─── audience.html ────────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/audience.html", """
{% load i18n %}
<section class="bg-white py-20" aria-labelledby="audience-heading">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

    <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4 mb-12">
      <div>
        {% if audience_header and audience_header.section_label %}
          <p class="inline-flex items-center gap-3 text-primary-600 text-xs font-semibold uppercase tracking-widest mb-3">
            <span class="w-6 h-px bg-primary-400" aria-hidden="true"></span>
            {{ audience_header.section_label }}
          </p>
        {% endif %}
        <h2 id="audience-heading" class="text-3xl sm:text-4xl font-bold text-gray-900">
          {% if audience_header %}{{ audience_header.heading }}{% else %}{% trans "Who does IRDM serve?" %}{% endif %}
        </h2>
        {% if audience_header and audience_header.description %}
          <p class="mt-3 text-base text-gray-500 max-w-2xl">{{ audience_header.description }}</p>
        {% endif %}
      </div>
      {% if audience_header and audience_header.cta_label and audience_header.cta_url %}
        <a href="{{ audience_header.cta_url }}"
           class="inline-flex items-center gap-2 px-6 py-3 bg-primary-600 hover:bg-primary-500 text-white text-sm font-semibold rounded-lg transition-colors flex-shrink-0">
          {{ audience_header.cta_label }}
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </a>
      {% endif %}
    </div>

    {% if audience_segments %}
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-6">
        {% for segment in audience_segments %}
          <div class="bg-gray-50 rounded-2xl p-6 border border-gray-100 hover:border-primary-200 hover:shadow-md transition-all duration-200 flex flex-col">
            <div class="w-12 h-12 rounded-xl bg-primary-100 flex items-center justify-center mb-4 flex-shrink-0">
              <svg class="w-6 h-6 text-primary-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                {% if segment.icon == "building-office" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21"/>
                {% elif segment.icon == "heart" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"/>
                {% elif segment.icon == "academic-cap" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5"/>
                {% elif segment.icon == "briefcase" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 00.75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 00-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0112 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 01-.673-.38m0 0A2.18 2.18 0 013 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 013.413-.387m7.5 0V5.25A2.25 2.25 0 0013.5 3h-3a2.25 2.25 0 00-2.25 2.25v.894m7.5 0a48.667 48.667 0 00-7.5 0M12 12.75h.008v.008H12v-.008z"/>
                {% elif segment.icon == "globe-alt" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 017.843 4.582M12 3a8.997 8.997 0 00-7.843 4.582m15.686 0A11.953 11.953 0 0112 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0121 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0112 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 013 12c0-1.605.42-3.113 1.157-4.418"/>
                {% else %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z"/>
                {% endif %}
              </svg>
            </div>
            <h3 class="text-base font-bold text-gray-900 mb-2">{{ segment.title }}</h3>
            {% if segment.description %}
              <p class="text-sm text-gray-500 leading-relaxed mb-4 flex-1">{{ segment.description }}</p>
            {% endif %}
            {% with tags=segment.tags.all %}
              {% if tags %}
                <div class="flex flex-wrap gap-1 mb-5">
                  {% for tag in tags %}
                    <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-primary-50 text-primary-700 border border-primary-100">{{ tag.label }}</span>
                  {% endfor %}
                </div>
              {% endif %}
            {% endwith %}
            {% if segment.cta_label and segment.cta_url %}
              <a href="{{ segment.cta_url }}"
                 class="inline-flex items-center gap-1 text-sm font-semibold text-primary-600 hover:text-primary-800 transition-colors mt-auto group">
                {{ segment.cta_label }}
                <svg class="w-4 h-4 transition-transform group-hover:translate-x-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                </svg>
              </a>
            {% endif %}
          </div>
        {% endfor %}
      </div>
    {% endif %}

  </div>
</section>
""")


# ─── methodology.html ─────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/methodology.html", """
{% load i18n %}
<section class="bg-gray-50 py-20" aria-labelledby="methodology-heading">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="lg:grid lg:grid-cols-5 lg:gap-12">

      <div class="lg:col-span-2 mb-12 lg:mb-0">
        {% if methodology_header and methodology_header.section_label %}
          <p class="inline-flex items-center gap-3 text-primary-600 text-xs font-semibold uppercase tracking-widest mb-3">
            <span class="w-6 h-px bg-primary-400" aria-hidden="true"></span>
            {{ methodology_header.section_label }}
          </p>
        {% endif %}
        <h2 id="methodology-heading" class="text-3xl sm:text-4xl font-bold text-gray-900 mb-4">
          {% if methodology_header %}{{ methodology_header.heading }}{% else %}{% trans "How IRDM Creates Impact" %}{% endif %}
        </h2>
        {% if methodology_header and methodology_header.description %}
          <p class="text-base text-gray-500 leading-relaxed mb-8">{{ methodology_header.description }}</p>
        {% endif %}
        {% if methodology_header and methodology_header.cta_label and methodology_header.cta_url %}
          <a href="{{ methodology_header.cta_url }}"
             class="inline-flex items-center gap-2 px-6 py-3 bg-primary-600 hover:bg-primary-500 text-white text-sm font-semibold rounded-lg transition-colors">
            {{ methodology_header.cta_label }}
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
            </svg>
          </a>
        {% endif %}
      </div>

      <div class="lg:col-span-3">
        {% if methodology_steps %}
          <div class="space-y-8">
            {% for step in methodology_steps %}
              <div class="flex gap-5">
                <div class="flex flex-col items-center flex-shrink-0">
                  <div class="w-12 h-12 rounded-full bg-primary-600 flex items-center justify-center text-white text-sm font-bold shadow-md shadow-primary-200">
                    {{ step.step_number|stringformat:"02d" }}
                  </div>
                  {% if not forloop.last %}
                    <div class="w-0.5 flex-1 mt-2 bg-primary-200 min-h-8" aria-hidden="true"></div>
                  {% endif %}
                </div>
                <div class="pb-8">
                  <h3 class="text-base font-bold text-gray-900 mb-1">{{ step.title }}</h3>
                  {% if step.body %}
                    <p class="text-sm text-gray-500 leading-relaxed">{{ step.body }}</p>
                  {% endif %}
                </div>
              </div>
            {% endfor %}
          </div>
        {% endif %}
      </div>

    </div>
  </div>
</section>
""")


# ─── capabilities.html ────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/capabilities.html", """
{% load i18n %}
<section class="bg-white py-20" aria-labelledby="capabilities-heading">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

    <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4 mb-12">
      <div>
        {% if capabilities_header and capabilities_header.section_label %}
          <p class="inline-flex items-center gap-3 text-primary-600 text-xs font-semibold uppercase tracking-widest mb-3">
            <span class="w-6 h-px bg-primary-400" aria-hidden="true"></span>
            {{ capabilities_header.section_label }}
          </p>
        {% endif %}
        <h2 id="capabilities-heading" class="text-3xl sm:text-4xl font-bold text-gray-900">
          {% if capabilities_header %}{{ capabilities_header.heading }}{% else %}{% trans "Core Capabilities" %}{% endif %}
        </h2>
        {% if capabilities_header and capabilities_header.description %}
          <p class="mt-3 text-base text-gray-500 max-w-2xl">{{ capabilities_header.description }}</p>
        {% endif %}
      </div>
      {% if capabilities_header and capabilities_header.cta_label and capabilities_header.cta_url %}
        <a href="{{ capabilities_header.cta_url }}"
           class="inline-flex items-center gap-2 px-6 py-3 bg-primary-600 hover:bg-primary-500 text-white text-sm font-semibold rounded-lg transition-colors flex-shrink-0">
          {{ capabilities_header.cta_label }}
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </a>
      {% endif %}
    </div>

    {% if core_capabilities %}
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        {% for cap in core_capabilities %}
          <div class="group relative rounded-2xl overflow-hidden bg-primary-900 aspect-video">
            {% if cap.background_image %}
              <img src="{{ cap.background_image.url }}" alt="" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" loading="lazy" aria-hidden="true" />
            {% endif %}
            <div class="absolute inset-0 bg-gradient-to-t from-primary-950/90 via-primary-950/40 to-primary-600/20" aria-hidden="true"></div>
            <div class="absolute top-4 left-4 w-10 h-10 rounded-lg bg-white/15 backdrop-blur-sm flex items-center justify-center">
              <svg class="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9.813 15.904L9 18.75l-.813-2.846a4.5 4.5 0 00-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 003.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 003.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 00-3.09 3.09z"/>
              </svg>
            </div>
            <div class="absolute bottom-0 left-0 right-0 p-4">
              <h3 class="text-sm font-bold text-white leading-tight">{{ cap.title }}</h3>
            </div>
          </div>
        {% endfor %}
      </div>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-4">
        {% for cap in core_capabilities %}
          {% if cap.description %}
            <p class="text-sm text-gray-500 leading-relaxed">{{ cap.description }}</p>
          {% else %}
            <div></div>
          {% endif %}
        {% endfor %}
      </div>
    {% endif %}

  </div>
</section>
""")


# ─── philosophy.html ──────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/philosophy.html", """
{% load i18n %}
<section class="bg-gray-50 py-20" aria-labelledby="philosophy-heading">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

    <div class="mb-12">
      {% if philosophy_header and philosophy_header.section_label %}
        <p class="inline-flex items-center gap-3 text-primary-600 text-xs font-semibold uppercase tracking-widest mb-3">
          <span class="w-6 h-px bg-primary-400" aria-hidden="true"></span>
          {{ philosophy_header.section_label }}
        </p>
      {% endif %}
      <h2 id="philosophy-heading" class="text-3xl sm:text-4xl font-bold text-gray-900 mb-3">
        {% if philosophy_header %}{{ philosophy_header.heading }}{% else %}{% trans "IRDM's Special Approach" %}{% endif %}
      </h2>
      {% if philosophy_header and philosophy_header.description %}
        <p class="text-base text-gray-500 max-w-2xl leading-relaxed">{{ philosophy_header.description }}</p>
      {% endif %}
    </div>

    {% if philosophy_principles %}
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
        {% for principle in philosophy_principles %}
          <div class="bg-white rounded-2xl border border-gray-200 p-8 hover:border-primary-200 hover:shadow-sm transition-all duration-200">
            <div class="flex items-center gap-4 mb-4">
              <div class="w-10 h-10 rounded-lg bg-primary-50 flex items-center justify-center flex-shrink-0">
                <svg class="w-5 h-5 text-primary-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  {% if principle.icon == "link" %}
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244"/>
                  {% elif principle.icon == "share" %}
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z"/>
                  {% elif principle.icon == "hand-raised" %}
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M10.05 4.575a1.575 1.575 0 10-3.15 0v3m3.15-3v-1.5a1.575 1.575 0 013.15 0v1.5m0 0v2.25m0-2.25a1.575 1.575 0 013.15 0v1.5m-3.15-1.5a1.575 1.575 0 00-3.15 0v1.5m0 0v2.25m0-2.25a1.575 1.575 0 013.15 0v2.25m-3.15-2.25v2.25m3.15 0v2.25m0 0a1.575 1.575 0 01-1.575 1.575h-7.875A1.575 1.575 0 013 16.5v-2.25"/>
                  {% else %}
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z"/>
                  {% endif %}
                </svg>
              </div>
              <span class="text-3xl font-black text-primary-100 select-none">{{ principle.number|stringformat:"02d" }}</span>
            </div>
            <h3 class="text-base font-bold text-gray-900 mb-2">{{ principle.title }}</h3>
            {% if principle.body %}
              <p class="text-sm text-gray-500 leading-relaxed">{{ principle.body }}</p>
            {% endif %}
          </div>
        {% endfor %}
      </div>
    {% endif %}

  </div>
</section>
""")


# ─── evidence.html ────────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/evidence.html", """
{% load i18n %}
<section class="bg-primary-950 py-20" aria-labelledby="evidence-heading">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

    <div class="lg:grid lg:grid-cols-3 lg:gap-16">
      <div class="lg:col-span-1 mb-12 lg:mb-0">
        {% if evidence_header and evidence_header.section_label %}
          <p class="inline-flex items-center gap-3 text-primary-300 text-xs font-semibold uppercase tracking-widest mb-3">
            <span class="w-6 h-px bg-primary-500" aria-hidden="true"></span>
            {{ evidence_header.section_label }}
          </p>
        {% endif %}
        <h2 id="evidence-heading" class="text-3xl sm:text-4xl font-bold text-white mb-4">
          {% if evidence_header %}{{ evidence_header.heading }}{% else %}{% trans "Organisations IRDM has partnered with" %}{% endif %}
        </h2>
        {% if evidence_header and evidence_header.description %}
          <p class="text-base text-white/60 leading-relaxed mb-8">{{ evidence_header.description }}</p>
        {% endif %}
        {% if evidence_header and evidence_header.cta_label and evidence_header.cta_url %}
          <a href="{{ evidence_header.cta_url }}"
             class="inline-flex items-center gap-2 px-6 py-3 bg-primary-600 hover:bg-primary-500 text-white text-sm font-semibold rounded-lg transition-colors">
            {{ evidence_header.cta_label }}
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
            </svg>
          </a>
        {% endif %}
      </div>

      <div class="lg:col-span-2">
        {% if evidence_header and evidence_header.partners_label %}
          <p class="text-xs font-semibold text-white/40 uppercase tracking-widest mb-6">{{ evidence_header.partners_label }}</p>
        {% endif %}
        {% if partner_logos %}
          <div class="grid grid-cols-2 sm:grid-cols-3 gap-4">
            {% for partner in partner_logos %}
              <div class="bg-white/5 rounded-xl p-4 flex items-center justify-center border border-white/10 hover:border-white/20 transition-colors">
                {% if partner.logo %}
                  {% if partner.website_url %}
                    <a href="{{ partner.website_url }}" target="_blank" rel="noopener noreferrer" aria-label="{{ partner.name }}">
                      <img src="{{ partner.logo.url }}" alt="{{ partner.name }}" class="h-8 w-auto max-w-[120px] object-contain opacity-70 hover:opacity-100 transition-opacity grayscale hover:grayscale-0" loading="lazy" />
                    </a>
                  {% else %}
                    <img src="{{ partner.logo.url }}" alt="{{ partner.name }}" class="h-8 w-auto max-w-[120px] object-contain opacity-60 grayscale" loading="lazy" />
                  {% endif %}
                {% else %}
                  <span class="text-xs text-white/50 text-center font-medium">{{ partner.name }}</span>
                {% endif %}
              </div>
            {% endfor %}
          </div>
        {% endif %}
      </div>
    </div>

    {% if statistics %}
      <div class="mt-16 pt-12 border-t border-white/10">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
          {% for item in statistics %}
            <div class="text-center">
              <p class="text-4xl sm:text-5xl font-black text-white mb-1">{{ item.value }}</p>
              <p class="text-xs font-semibold text-primary-300 uppercase tracking-wide">{{ item.label }}</p>
              {% if item.description %}
                <p class="mt-1 text-xs text-white/40">{{ item.description }}</p>
              {% endif %}
            </div>
          {% endfor %}
        </div>
      </div>
    {% endif %}

  </div>
</section>
""")


# ─── knowledge.html ───────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/knowledge.html", """
{% load i18n %}
<section class="bg-white py-20" aria-labelledby="knowledge-heading">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

    <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4 mb-12">
      <div>
        {% if knowledge_header and knowledge_header.section_label %}
          <p class="inline-flex items-center gap-3 text-primary-600 text-xs font-semibold uppercase tracking-widest mb-3">
            <span class="w-6 h-px bg-primary-400" aria-hidden="true"></span>
            {{ knowledge_header.section_label }}
          </p>
        {% endif %}
        <h2 id="knowledge-heading" class="text-3xl sm:text-4xl font-bold text-gray-900">
          {% if knowledge_header %}{{ knowledge_header.heading }}{% else %}{% trans "Knowledge & Professional Forums" %}{% endif %}
        </h2>
        {% if knowledge_header and knowledge_header.description %}
          <p class="mt-3 text-base text-gray-500 max-w-2xl leading-relaxed">{{ knowledge_header.description }}</p>
        {% endif %}
      </div>
      {% if knowledge_header and knowledge_header.cta_label and knowledge_header.cta_url %}
        <a href="{{ knowledge_header.cta_url }}"
           class="inline-flex items-center gap-2 px-6 py-3 bg-primary-600 hover:bg-primary-500 text-white text-sm font-semibold rounded-lg transition-colors flex-shrink-0">
          {{ knowledge_header.cta_label }}
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </a>
      {% endif %}
    </div>

    {% if knowledge_categories %}
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        {% for cat in knowledge_categories %}
          <div class="bg-gray-50 rounded-2xl p-6 border border-gray-100 hover:border-primary-200 hover:shadow-md transition-all duration-200 flex flex-col">
            <div class="w-12 h-12 rounded-xl bg-primary-50 flex items-center justify-center mb-4 flex-shrink-0">
              <svg class="w-6 h-6 text-primary-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                {% if cat.icon == "document-text" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"/>
                {% elif cat.icon == "calendar" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5"/>
                {% elif cat.icon == "chat-bubble-left-ellipsis" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8.625 9.75a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375m-13.5 3.01c0 1.6 1.123 2.994 2.707 3.227 1.087.16 2.185.283 3.293.369V21l4.184-4.183a1.14 1.14 0 01.778-.332 48.294 48.294 0 005.83-.498c1.585-.233 2.708-1.626 2.708-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z"/>
                {% elif cat.icon == "newspaper" %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 7.5h1.5m-1.5 3h1.5m-7.5 3h7.5m-7.5 3h7.5m3-9h3.375c.621 0 1.125.504 1.125 1.125V18a2.25 2.25 0 01-2.25 2.25M16.5 7.5V18a2.25 2.25 0 002.25 2.25M16.5 7.5V4.875c0-.621-.504-1.125-1.125-1.125H4.125C3.504 3.75 3 4.254 3 4.875V18a2.25 2.25 0 002.25 2.25h13.5M6 7.5h3v3H6V7.5z"/>
                {% else %}
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25"/>
                {% endif %}
              </svg>
            </div>
            <p class="text-xs font-bold text-primary-600 uppercase tracking-widest mb-2">{{ cat.category_label }}</p>
            <h3 class="text-base font-bold text-gray-900 mb-3 flex-1">{{ cat.title }}</h3>
            {% if cat.cta_label and cat.cta_url %}
              <a href="{{ cat.cta_url }}"
                 class="inline-flex items-center gap-1 text-sm font-semibold text-primary-600 hover:text-primary-800 transition-colors mt-auto group">
                {{ cat.cta_label }}
                <svg class="w-4 h-4 transition-transform group-hover:translate-x-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                </svg>
              </a>
            {% endif %}
          </div>
        {% endfor %}
      </div>
    {% endif %}

  </div>
</section>
""")


# ─── cta_banner.html ──────────────────────────────────────────────────────────

write("apps/home/templates/home/sections/cta_banner.html", """
{% load i18n %}
{% if cta_banner %}
<section class="relative overflow-hidden" aria-labelledby="cta-banner-heading">
  {% if cta_banner.background_image %}
    <div class="absolute inset-0 z-0">
      <img src="{{ cta_banner.background_image.url }}" alt="" class="w-full h-full object-cover object-center" loading="lazy" aria-hidden="true" />
    </div>
  {% else %}
    <div class="absolute inset-0 z-0 bg-gradient-to-r from-primary-950 via-primary-900 to-primary-800" aria-hidden="true"></div>
  {% endif %}
  <div class="absolute inset-0 z-10 bg-primary-950/70" aria-hidden="true"></div>
  <div class="relative z-20 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24 lg:py-32">
    <div class="max-w-2xl">
      {% if cta_banner.section_label %}
        <p class="inline-flex items-center gap-3 text-primary-300 text-xs font-semibold uppercase tracking-widest mb-4">
          <span class="w-6 h-px bg-primary-400" aria-hidden="true"></span>
          {{ cta_banner.section_label }}
        </p>
      {% endif %}
      <h2 id="cta-banner-heading" class="text-3xl sm:text-4xl lg:text-5xl font-bold text-white leading-tight mb-4">
        {{ cta_banner.heading }}
      </h2>
      {% if cta_banner.description %}
        <p class="text-base text-white/70 leading-relaxed mb-8">{{ cta_banner.description }}</p>
      {% endif %}
      {% if cta_banner.cta_label and cta_banner.cta_url %}
        <a href="{{ cta_banner.cta_url }}"
           class="inline-flex items-center gap-2 px-8 py-4 bg-orange-500 hover:bg-orange-400 text-white font-semibold rounded-xl transition-all duration-150 shadow-lg hover:shadow-xl hover:-translate-y-0.5">
          {{ cta_banner.cta_label }}
          <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </a>
      {% endif %}
    </div>
  </div>
</section>
{% endif %}
""")


print("All templates written.")
