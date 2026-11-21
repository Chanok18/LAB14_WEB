#!/usr/bin/env bash
# Rediseño: estilo neón/glass animado + modo claro/oscuro + cambio de tipografía
# Ejecutar desde ~/my-portfolio:  bash redesign-portfolio.sh
set -e
cd ~/my-portfolio
mkdir -p src/components "src/app/projects/[slug]" src/app/about src/app/contact

# =====================================================  globals.css
cat > src/app/globals.css <<'EOF'
@import "tailwindcss";

/* ---------- Tema OSCURO (por defecto) ---------- */
:root,
html[data-theme="dark"] {
  --bg: #050b1f;
  --bg2: #0c1f5c;
  --glow2: rgba(124, 58, 237, 0.18);
  --text: #eaf2ff;
  --muted: #a3b8dc;
  --accent: #22d3ee;
  --accent2: #3b82f6;
  --accent-text: #67e8f9;
  --card: rgba(13, 28, 68, 0.55);
  --nav: rgba(5, 11, 31, 0.7);
  --border: rgba(96, 165, 250, 0.35);
  --glow: rgba(34, 211, 238, 0.35);
  --shadow: rgba(0, 0, 0, 0.6);
  --chip: rgba(59, 130, 246, 0.18);
  --input: rgba(5, 11, 31, 0.6);
  --btn-text: #04122e;
  --g1: #22d3ee;
  --g2: #60a5fa;
  --g3: #c4b5fd;
  --orb1: rgba(165, 180, 252, 0.95);
  --orb2: rgba(79, 70, 229, 0.7);
  --cube1: rgba(96, 165, 250, 0.35);
  --cube2: rgba(124, 58, 237, 0.2);
  --danger: #fca5a5;
  --ok: #86efac;
  color-scheme: dark;
}

/* ---------- Tema CLARO ---------- */
html[data-theme="light"] {
  --bg: #f2f6ff;
  --bg2: #cfe0ff;
  --glow2: rgba(124, 58, 237, 0.12);
  --text: #0b1b3a;
  --muted: #41567f;
  --accent: #0369a1;
  --accent2: #2563eb;
  --accent-text: #0369a1;
  --card: rgba(255, 255, 255, 0.72);
  --nav: rgba(242, 246, 255, 0.82);
  --border: rgba(37, 99, 235, 0.28);
  --glow: rgba(37, 99, 235, 0.28);
  --shadow: rgba(30, 64, 175, 0.25);
  --chip: rgba(37, 99, 235, 0.1);
  --input: rgba(255, 255, 255, 0.92);
  --btn-text: #ffffff;
  --g1: #0369a1;
  --g2: #2563eb;
  --g3: #7c3aed;
  --orb1: rgba(147, 197, 253, 0.95);
  --orb2: rgba(99, 102, 241, 0.55);
  --cube1: rgba(37, 99, 235, 0.18);
  --cube2: rgba(124, 58, 237, 0.12);
  --danger: #b91c1c;
  --ok: #15803d;
  color-scheme: light;
}

/* ---------- Tipografías (botón "Aa") ---------- */
:root,
html[data-font="modern"] {
  --font-body: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  --font-head: "Trebuchet MS", "Segoe UI", system-ui, sans-serif;
}
html[data-font="elegant"] {
  --font-body: Georgia, Cambria, "Times New Roman", serif;
  --font-head: Georgia, "Palatino Linotype", "Times New Roman", serif;
}
html[data-font="code"] {
  --font-body: ui-monospace, SFMono-Regular, Menlo, Consolas, "Liberation Mono", monospace;
  --font-head: ui-monospace, SFMono-Regular, Menlo, Consolas, "Liberation Mono", monospace;
}

html { scroll-behavior: smooth; }

body {
  font-family: var(--font-body);
  color: var(--text);
  background:
    radial-gradient(1200px 600px at 50% -10%, var(--bg2), transparent 60%),
    radial-gradient(900px 500px at 100% 100%, var(--glow2), transparent 60%),
    var(--bg);
  background-attachment: fixed;
  transition: color 0.4s ease;
}
h1, h2, h3 { font-family: var(--font-head); }

/* ---------- Utilidades de color ---------- */
.text-main { color: var(--text); }
.text-muted { color: var(--muted); }
.text-accent { color: var(--accent-text); }

/* ---------- Glass ---------- */
.glass {
  background: var(--card);
  border: 1px solid var(--border);
  -webkit-backdrop-filter: blur(14px);
  backdrop-filter: blur(14px);
  border-radius: 1rem;
  box-shadow: 0 10px 40px -12px var(--shadow);
}
.glass-hover { transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease; }
.glass-hover:hover {
  transform: translateY(-6px);
  border-color: var(--accent);
  box-shadow: 0 0 30px var(--glow), 0 20px 50px -15px var(--shadow);
}

/* ---------- Botones ---------- */
.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  border-radius: 0.75rem;
  font-weight: 600;
  cursor: pointer;
  border: 1px solid transparent;
  transition: transform 0.25s ease, box-shadow 0.25s ease, border-color 0.25s ease;
}
.btn:hover { transform: translateY(-2px) scale(1.03); }
.btn-primary {
  background: linear-gradient(135deg, var(--accent2), var(--accent));
  color: var(--btn-text);
  box-shadow: 0 0 22px var(--glow);
}
.btn-primary:hover { box-shadow: 0 0 36px var(--glow); }
.btn-ghost {
  background: var(--card);
  color: var(--text);
  border-color: var(--border);
}
.btn-ghost:hover { border-color: var(--accent); box-shadow: 0 0 22px var(--glow); }

/* ---------- Chips ---------- */
.chip {
  display: inline-block;
  font-size: 0.75rem;
  padding: 0.25rem 0.7rem;
  border-radius: 9999px;
  border: 1px solid var(--border);
  background: var(--chip);
  color: var(--text);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.chip:hover { transform: translateY(-2px); box-shadow: 0 0 14px var(--glow); }

/* ---------- Texto neón animado ---------- */
.neon-text {
  background: linear-gradient(90deg, var(--g1), var(--g2), var(--g3), var(--g1));
  background-size: 300% 100%;
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  animation: gradientShift 7s linear infinite;
  filter: drop-shadow(0 0 16px var(--glow));
}
.section-title { position: relative; display: inline-block; color: var(--text); }
.section-title::after {
  content: "";
  display: block;
  height: 3px;
  width: 60%;
  margin: 0.5rem 0 0;
  border-radius: 9999px;
  background: linear-gradient(90deg, var(--g1), var(--g3));
  box-shadow: 0 0 12px var(--glow);
}
.section-title.center::after { margin-inline: auto; }

/* ---------- Navbar ---------- */
.nav-glass {
  background: var(--nav);
  -webkit-backdrop-filter: blur(14px);
  backdrop-filter: blur(14px);
  border-bottom: 1px solid var(--border);
}
.nav-link { position: relative; color: var(--text); padding: 0.25rem 0; transition: color 0.2s ease; }
.nav-link::after {
  content: "";
  position: absolute;
  left: 0; bottom: -2px;
  height: 2px; width: 100%;
  background: linear-gradient(90deg, var(--g1), var(--g3));
  box-shadow: 0 0 10px var(--glow);
  transform: scaleX(0);
  transform-origin: left;
  transition: transform 0.3s ease;
}
.nav-link:hover::after, .nav-link.active::after { transform: scaleX(1); }
.nav-link.active, .nav-link:hover { color: var(--accent-text); }

/* ---------- Interruptor de tema + botón de fuente ---------- */
.theme-switch {
  display: inline-flex;
  padding: 3px;
  gap: 2px;
  border-radius: 9999px;
  border: 1px solid var(--border);
  background: var(--card);
}
.theme-btn {
  display: grid; place-items: center;
  width: 30px; height: 30px;
  border-radius: 9999px;
  color: var(--muted);
  cursor: pointer;
  transition: background 0.3s ease, color 0.3s ease, box-shadow 0.3s ease;
}
html[data-theme="light"] .theme-sun,
html[data-theme="dark"] .theme-moon {
  background: linear-gradient(135deg, var(--accent2), var(--accent));
  color: var(--btn-text);
  box-shadow: 0 0 14px var(--glow);
}
.font-btn {
  min-width: 42px; height: 36px;
  padding: 0 0.6rem;
  border-radius: 0.6rem;
  border: 1px solid var(--border);
  background: var(--card);
  color: var(--text);
  font-weight: 700;
  cursor: pointer;
  transition: box-shadow 0.25s ease, border-color 0.25s ease, transform 0.25s ease;
}
.font-btn:hover { border-color: var(--accent); box-shadow: 0 0 16px var(--glow); transform: translateY(-1px); }

/* ---------- Avatar con anillo giratorio ---------- */
.avatar-float { width: 150px; height: 150px; margin-inline: auto; animation: float 6s ease-in-out infinite; }
.avatar-ring { position: relative; width: 100%; height: 100%; border-radius: 50%; padding: 4px; box-shadow: 0 0 40px var(--glow); }
.avatar-ring::before {
  content: "";
  position: absolute; inset: 0;
  border-radius: 50%;
  background: conic-gradient(from 0deg, var(--g1), var(--g2), var(--g3), var(--g1));
  animation: spin 6s linear infinite;
}
.avatar-inner { position: relative; width: 100%; height: 100%; border-radius: 50%; overflow: hidden; background: var(--bg); }

/* ---------- Fondo animado ---------- */
.scene { position: fixed; inset: 0; z-index: 0; overflow: hidden; pointer-events: none; }
.orb {
  position: absolute; border-radius: 50%;
  background: radial-gradient(circle at 30% 30%, var(--orb1), var(--orb2));
  box-shadow: 0 0 30px var(--glow);
  animation: float 9s ease-in-out infinite;
}
.cube {
  position: absolute;
  border: 1px solid var(--border);
  border-radius: 16px;
  background: linear-gradient(135deg, var(--cube1), var(--cube2));
  box-shadow: 0 0 30px var(--glow), inset 0 0 24px var(--cube1);
  animation: floatRot 16s ease-in-out infinite;
}
.star {
  position: absolute; width: 3px; height: 3px; border-radius: 50%;
  background: var(--accent);
  box-shadow: 0 0 8px var(--accent);
  animation: twinkle 3.5s ease-in-out infinite;
}

/* ---------- Animaciones de entrada ---------- */
.anim-fade-up { animation: fadeUp 0.7s ease both; }
.reveal { opacity: 0; transform: translateY(28px); transition: opacity 0.7s ease, transform 0.7s ease; }
.reveal.in { opacity: 1; transform: none; }

.card-shine {
  position: absolute; inset: 0;
  background: linear-gradient(120deg, transparent 30%, rgba(255,255,255,0.18) 50%, transparent 70%);
  transform: translateX(-120%);
  transition: transform 0.8s ease;
}
.group:hover .card-shine { transform: translateX(120%); }

/* ---------- Formularios ---------- */
.input {
  width: 100%;
  padding: 0.65rem 1rem;
  border-radius: 0.75rem;
  border: 1px solid var(--border);
  background: var(--input);
  color: var(--text);
  transition: border-color 0.25s ease, box-shadow 0.25s ease;
}
.input:focus { outline: none; border-color: var(--accent); box-shadow: 0 0 0 3px var(--glow); }

.glow-list li::marker { color: var(--accent); }

/* ---------- Keyframes ---------- */
@keyframes float { 0%,100% { transform: translateY(0); } 50% { transform: translateY(-18px); } }
@keyframes floatRot {
  0%,100% { transform: translateY(0) rotate(12deg); }
  50% { transform: translateY(-26px) rotate(32deg); }
}
@keyframes spin { to { transform: rotate(360deg); } }
@keyframes gradientShift { 0% { background-position: 0% 50%; } 100% { background-position: 300% 50%; } }
@keyframes fadeUp { from { opacity: 0; transform: translateY(24px); } to { opacity: 1; transform: none; } }
@keyframes twinkle { 0%,100% { opacity: 0.2; transform: scale(0.8); } 50% { opacity: 1; transform: scale(1.4); } }

@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation: none !important; transition: none !important; }
  .reveal { opacity: 1; transform: none; }
}
EOF

# =====================================================  layout.tsx
cat > src/app/layout.tsx <<'EOF'
import type { Metadata, Viewport } from 'next';
import './globals.css';
import Header from '@/components/Header';
import Footer from '@/components/Footer';
import Background from '@/components/Background';
import { personalInfo } from '@/lib/data';

export const viewport: Viewport = {
  themeColor: '#050b1f',
};

export const metadata: Metadata = {
  metadataBase: new URL(personalInfo.siteUrl),
  title: {
    default: `${personalInfo.name} - ${personalInfo.title}`,
    template: `%s | ${personalInfo.name}`,
  },
  description: personalInfo.description,
  keywords: [
    'desarrollador web',
    'desarrollo de software',
    'next.js',
    'react',
    'typescript',
    'portafolio',
    'laravel',
    'java',
    'kotlin',
    'desarrollador backend',
    'Lima',
  ],
  authors: [{ name: personalInfo.name }],
  creator: personalInfo.name,
  openGraph: {
    type: 'website',
    locale: 'es_PE',
    url: personalInfo.siteUrl,
    title: `${personalInfo.name} - ${personalInfo.title}`,
    description: personalInfo.description,
    siteName: personalInfo.name,
    images: [
      {
        url: '/perfil.png',
        alt: `${personalInfo.name} - Portafolio`,
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: `${personalInfo.name} - ${personalInfo.title}`,
    description: personalInfo.description,
    images: ['/perfil.png'],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
};

// Aplica tema y tipografía guardados ANTES de pintar (evita parpadeos)
const initScript = `(function(){try{var d=document.documentElement;d.dataset.theme=localStorage.getItem('theme')||'dark';d.dataset.font=localStorage.getItem('font')||'modern';}catch(e){document.documentElement.dataset.theme='dark';document.documentElement.dataset.font='modern';}})();`;

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="es" data-theme="dark" data-font="modern" suppressHydrationWarning>
      <head>
        <script dangerouslySetInnerHTML={{ __html: initScript }} />
        <noscript>
          <style>{`.reveal{opacity:1!important;transform:none!important}`}</style>
        </noscript>
      </head>
      <body>
        <Background />
        <div className="relative z-10 flex flex-col min-h-screen">
          <Header />
          <main className="grow">{children}</main>
          <Footer />
        </div>
      </body>
    </html>
  );
}
EOF

# =====================================================  Background
cat > src/components/Background.tsx <<'EOF'
const orbs = [
  { l: '8%', t: '18%', s: 36, d: 0 },
  { l: '86%', t: '20%', s: 46, d: 2 },
  { l: '93%', t: '62%', s: 60, d: 1 },
  { l: '4%', t: '70%', s: 28, d: 3 },
  { l: '20%', t: '40%', s: 16, d: 1.5 },
  { l: '78%', t: '48%', s: 14, d: 2.5 },
];

const cubes = [
  { l: '3%', t: '12%', s: 64, d: 0 },
  { l: '90%', t: '28%', s: 100, d: 1 },
  { l: '14%', t: '78%', s: 54, d: 2 },
  { l: '80%', t: '82%', s: 70, d: 3 },
];

export default function Background() {
  return (
    <div className="scene" aria-hidden="true">
      {Array.from({ length: 22 }).map((_, i) => (
        <span
          key={`s${i}`}
          className="star"
          style={{
            left: `${(i * 37 + 11) % 100}%`,
            top: `${(i * 53 + 7) % 100}%`,
            animationDelay: `${(i % 7) * 0.5}s`,
          }}
        />
      ))}
      {orbs.map((o, i) => (
        <span
          key={`o${i}`}
          className="orb"
          style={{ left: o.l, top: o.t, width: o.s, height: o.s, animationDelay: `${o.d}s` }}
        />
      ))}
      {cubes.map((c, i) => (
        <span
          key={`c${i}`}
          className="cube hidden md:block"
          style={{ left: c.l, top: c.t, width: c.s, height: c.s, animationDelay: `${c.d}s` }}
        />
      ))}
    </div>
  );
}
EOF

# =====================================================  Reveal
cat > src/components/Reveal.tsx <<'EOF'
'use client';

import { useEffect, useRef } from 'react';

export default function Reveal({
  children,
  delay = 0,
  className = '',
}: {
  children: React.ReactNode;
  delay?: number;
  className?: string;
}) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const io = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          el.classList.add('in');
          io.disconnect();
        }
      },
      { threshold: 0.12 }
    );
    io.observe(el);
    return () => io.disconnect();
  }, []);

  return (
    <div ref={ref} className={`reveal ${className}`} style={{ transitionDelay: `${delay}ms` }}>
      {children}
    </div>
  );
}
EOF

# =====================================================  Header
cat > src/components/Header.tsx <<'EOF'
'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { personalInfo } from '@/lib/data';

const links = [
  { href: '/', label: 'Inicio' },
  { href: '/projects', label: 'Proyectos' },
  { href: '/about', label: 'Sobre Mí' },
  { href: '/contact', label: 'Contacto' },
];

const FONTS: string[] = ['modern', 'elegant', 'code'];

function setTheme(theme: 'light' | 'dark') {
  document.documentElement.dataset.theme = theme;
  try {
    localStorage.setItem('theme', theme);
  } catch {}
}

function cycleFont() {
  const current = document.documentElement.dataset.font ?? 'modern';
  const next = FONTS[(FONTS.indexOf(current) + 1) % FONTS.length];
  document.documentElement.dataset.font = next;
  try {
    localStorage.setItem('font', next);
  } catch {}
}

export default function Header() {
  const pathname = usePathname();

  return (
    <header className="nav-glass sticky top-0 z-50">
      <nav className="container mx-auto px-4 py-3 flex flex-wrap items-center justify-between gap-3">
        <Link href="/" className="text-xl md:text-2xl font-extrabold text-main">
          {personalInfo.name}
        </Link>

        <div className="flex flex-wrap items-center gap-4 md:gap-6">
          <ul className="flex flex-wrap gap-4 md:gap-6">
            {links.map((l) => {
              const active =
                l.href === '/' ? pathname === '/' : pathname.startsWith(l.href);
              return (
                <li key={l.href}>
                  <Link
                    href={l.href}
                    className={`nav-link ${active ? 'active' : ''}`}
                    aria-current={active ? 'page' : undefined}
                  >
                    {l.label}
                  </Link>
                </li>
              );
            })}
          </ul>

          <div className="flex items-center gap-3">
            <div className="theme-switch" role="group" aria-label="Tema de color">
              <button
                type="button"
                className="theme-btn theme-sun"
                aria-label="Modo claro"
                title="Modo claro"
                onClick={() => setTheme('light')}
              >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" aria-hidden="true">
                  <circle cx="12" cy="12" r="4" />
                  <path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4" />
                </svg>
              </button>
              <button
                type="button"
                className="theme-btn theme-moon"
                aria-label="Modo oscuro"
                title="Modo oscuro"
                onClick={() => setTheme('dark')}
              >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
                  <path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z" />
                </svg>
              </button>
            </div>

            <button
              type="button"
              className="font-btn"
              aria-label="Cambiar estilo de texto"
              title="Cambiar estilo de texto"
              onClick={cycleFont}
            >
              Aa
            </button>
          </div>
        </div>
      </nav>
    </header>
  );
}
EOF

# =====================================================  Footer
cat > src/components/Footer.tsx <<'EOF'
import { personalInfo } from '@/lib/data';

export default function Footer() {
  return (
    <footer className="nav-glass mt-16 py-8" style={{ borderTop: '1px solid var(--border)', borderBottom: 'none' }}>
      <div className="container mx-auto px-4">
        <div className="flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-muted text-center md:text-left">
            © {new Date().getFullYear()} {personalInfo.name}. Todos los derechos reservados.
          </p>
          <div className="flex gap-6">
            <a href={personalInfo.github} target="_blank" rel="noopener noreferrer" className="nav-link" aria-label="GitHub">
              GitHub
            </a>
            <a href={personalInfo.linkedin} target="_blank" rel="noopener noreferrer" className="nav-link" aria-label="LinkedIn">
              LinkedIn
            </a>
            <a href={`mailto:${personalInfo.email}`} className="nav-link" aria-label="Email">
              Email
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF

# =====================================================  ProjectCard
cat > src/components/ProjectCard.tsx <<'EOF'
import Image from 'next/image';
import Link from 'next/link';
import { Project } from '@/types';

interface ProjectCardProps {
  project: Project;
}

export default function ProjectCard({ project }: ProjectCardProps) {
  return (
    <Link
      href={`/projects/${project.slug}`}
      className="group glass glass-hover block overflow-hidden p-3 h-full"
    >
      <div className="relative h-48 overflow-hidden rounded-xl">
        <Image
          src={project.image}
          alt={project.title}
          fill
          loading="lazy"
          className="object-cover transition-transform duration-500 group-hover:scale-110"
          sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
        />
        <span className="card-shine" aria-hidden="true" />
      </div>

      <div className="p-4">
        <h3 className="text-xl font-bold text-main mb-2 transition-colors group-hover:text-accent">
          {project.title}
        </h3>
        <p className="text-muted mb-4 line-clamp-2">{project.description}</p>

        <div className="flex flex-wrap gap-2">
          {project.technologies.slice(0, 3).map((tech) => (
            <span key={tech} className="chip">{tech}</span>
          ))}
          {project.technologies.length > 3 && (
            <span className="chip">+{project.technologies.length - 3}</span>
          )}
        </div>
      </div>
    </Link>
  );
}
EOF

# =====================================================  Home
cat > src/app/page.tsx <<'EOF'
import Image from 'next/image';
import Link from 'next/link';
import { projects, personalInfo } from '@/lib/data';
import ProjectCard from '@/components/ProjectCard';
import Reveal from '@/components/Reveal';

export default function Home() {
  const featuredProjects = projects.filter((p) => p.featured);

  return (
    <div className="container mx-auto px-4 py-12">
      {/* Hero */}
      <section className="text-center mb-24">
        <div className="avatar-float mb-8">
          <div className="avatar-ring">
            <div className="avatar-inner">
              <Image
                src={personalInfo.avatar}
                alt={personalInfo.name}
                fill
                className="object-cover"
                priority
                sizes="150px"
              />
            </div>
          </div>
        </div>

        <h1 className="neon-text anim-fade-up text-4xl sm:text-5xl md:text-7xl font-extrabold mb-4 pb-1">
          {personalInfo.name}
        </h1>
        <p
          className="anim-fade-up text-main text-xl md:text-2xl font-semibold mb-4"
          style={{ animationDelay: '0.15s' }}
        >
          {personalInfo.title}
        </p>
        <p
          className="anim-fade-up text-muted text-lg max-w-2xl mx-auto mb-8"
          style={{ animationDelay: '0.3s' }}
        >
          {personalInfo.description}
        </p>
        <div
          className="anim-fade-up flex flex-wrap gap-4 justify-center"
          style={{ animationDelay: '0.45s' }}
        >
          <Link href="/projects" className="btn btn-primary">Ver Proyectos</Link>
          <Link href="/about" className="btn btn-ghost">Sobre Mí</Link>
          <Link href="/contact" className="btn btn-ghost">Contacto</Link>
        </div>
      </section>

      {/* Proyectos destacados */}
      <section>
        <div className="text-center mb-10">
          <h2 className="section-title center text-3xl md:text-4xl font-bold">
            Proyectos Destacados
          </h2>
        </div>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {featuredProjects.map((project, i) => (
            <Reveal key={project.slug} delay={i * 120}>
              <ProjectCard project={project} />
            </Reveal>
          ))}
        </div>
      </section>
    </div>
  );
}
EOF

# =====================================================  Projects
cat > src/app/projects/page.tsx <<'EOF'
import { Metadata } from 'next';
import { projects } from '@/lib/data';
import ProjectCard from '@/components/ProjectCard';
import Reveal from '@/components/Reveal';

export const metadata: Metadata = {
  title: 'Proyectos',
  description: 'Explora mi colección de proyectos de desarrollo web y aplicaciones',
  openGraph: {
    title: 'Proyectos - Portafolio',
    description: 'Explora mi colección de proyectos de desarrollo web',
  },
};

export default function ProjectsPage() {
  return (
    <div className="container mx-auto px-4 py-12">
      <h1 className="section-title anim-fade-up text-4xl md:text-5xl font-bold mb-4">
        Mis Proyectos
      </h1>
      <p className="anim-fade-up text-muted text-lg mb-12" style={{ animationDelay: '0.15s' }}>
        Una colección de proyectos en los que he trabajado
      </p>
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        {projects.map((project, i) => (
          <Reveal key={project.slug} delay={i * 120}>
            <ProjectCard project={project} />
          </Reveal>
        ))}
      </div>
    </div>
  );
}
EOF

# =====================================================  Project detail
cat > "src/app/projects/[slug]/page.tsx" <<'EOF'
import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Image from 'next/image';
import Link from 'next/link';
import { projects } from '@/lib/data';

type Props = {
  params: Promise<{ slug: string }>;
};

export async function generateStaticParams() {
  return projects.map((project) => ({
    slug: project.slug,
  }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const project = projects.find((p) => p.slug === slug);

  if (!project) {
    return { title: 'Proyecto no encontrado' };
  }

  return {
    title: project.title,
    description: project.description,
    openGraph: {
      title: project.title,
      description: project.description,
      images: [project.image],
      type: 'article',
    },
    twitter: {
      card: 'summary_large_image',
      title: project.title,
      description: project.description,
      images: [project.image],
    },
  };
}

export default async function ProjectDetailPage({ params }: Props) {
  const { slug } = await params;
  const project = projects.find((p) => p.slug === slug);

  if (!project) {
    notFound();
  }

  return (
    <div className="container mx-auto px-4 py-12">
      <Link href="/projects" className="nav-link inline-block mb-6">
        ← Volver a Proyectos
      </Link>

      <article className="glass anim-fade-up p-6 md:p-10">
        <h1 className="neon-text text-3xl md:text-5xl font-extrabold mb-6 pb-1">
          {project.title}
        </h1>

        <div className="relative w-full h-72 md:h-96 mb-8 rounded-xl overflow-hidden">
          <Image
            src={project.image}
            alt={project.title}
            fill
            className="object-cover"
            priority
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 80vw, 1200px"
          />
        </div>

        <p className="text-main text-lg mb-6">{project.description}</p>

        {project.highlights && (
          <ul className="glow-list list-disc pl-6 space-y-2 text-muted mb-8">
            {project.highlights.map((item) => (
              <li key={item}>{item}</li>
            ))}
          </ul>
        )}

        <div className="mb-8">
          <h2 className="text-2xl font-bold text-main mb-3">Tecnologías Utilizadas</h2>
          <div className="flex flex-wrap gap-2">
            {project.technologies.map((tech) => (
              <span key={tech} className="chip">{tech}</span>
            ))}
          </div>
        </div>

        <div className="flex flex-wrap gap-4">
          {project.demoUrl && (
            <a href={project.demoUrl} target="_blank" rel="noopener noreferrer" className="btn btn-primary">
              Ver Demo
            </a>
          )}
          {project.githubUrl && (
            <a href={project.githubUrl} target="_blank" rel="noopener noreferrer" className="btn btn-ghost">
              Ver Código
            </a>
          )}
        </div>
      </article>
    </div>
  );
}
EOF

# =====================================================  About
cat > src/app/about/page.tsx <<'EOF'
import { Metadata } from 'next';
import Image from 'next/image';
import { personalInfo } from '@/lib/data';
import Reveal from '@/components/Reveal';

export const metadata: Metadata = {
  title: 'Sobre Mí',
  description: `Conoce más sobre ${personalInfo.name}, ${personalInfo.title}`,
};

const skills = [
  'Java',
  'Laravel & PHP',
  'Kotlin',
  'MySQL',
  'Firebase',
  'API REST & JWT',
  'Git & GitHub',
  'Trabajo en equipo',
];

const softSkills = ['Trabajo en equipo', 'Comunicación efectiva', 'Adaptabilidad', 'Aprendizaje continuo'];

export default function AboutPage() {
  return (
    <div className="container mx-auto px-4 py-12">
      <div className="max-w-4xl mx-auto">
        <h1 className="section-title anim-fade-up text-4xl md:text-5xl font-bold mb-10">
          Sobre Mí
        </h1>

        <div className="grid md:grid-cols-3 gap-8 mb-14">
          <Reveal className="md:col-span-1">
            <div className="glass p-2">
              <div className="relative w-full aspect-square rounded-xl overflow-hidden">
                <Image
                  src={personalInfo.avatar}
                  alt={personalInfo.name}
                  fill
                  className="object-cover"
                  loading="lazy"
                  sizes="(max-width: 768px) 100vw, 33vw"
                />
              </div>
            </div>
          </Reveal>

          <Reveal className="md:col-span-2" delay={150}>
            <div className="glass p-6 h-full">
              <h2 className="text-2xl font-bold neon-text mb-4 pb-1">
                ¡Hola! Soy {personalInfo.name}
              </h2>
              <div className="text-muted space-y-4">
                <p>{personalInfo.description}</p>
                <p>
                  Me enfoco en aplicar buenas prácticas de programación, el trabajo
                  en equipo y la resolución de problemas. Actualmente fortalezco mis
                  habilidades técnicas con proyectos personales y académicos
                  colaborativos.
                </p>
                <p>
                  <strong className="text-main">Educación:</strong> TECSUP - Diseño y
                  Desarrollo de Software (2024 - Actualidad).
                </p>
                <p>
                  <strong className="text-main">Idiomas:</strong> Inglés nivel
                  intermedio - Británico (en curso).
                </p>
                <p>
                  <strong className="text-main">Ubicación:</strong> {personalInfo.location}
                </p>
              </div>
            </div>
          </Reveal>
        </div>

        <section className="mb-14">
          <h2 className="section-title text-3xl font-bold mb-8">Habilidades Técnicas</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {skills.map((skill, i) => (
              <Reveal key={skill} delay={i * 70}>
                <div className="glass glass-hover p-4 text-center h-full">
                  <p className="font-semibold text-main">{skill}</p>
                </div>
              </Reveal>
            ))}
          </div>
        </section>

        <section className="mb-12">
          <h2 className="section-title text-3xl font-bold mb-6">Habilidades Blandas</h2>
          <Reveal>
            <div className="flex flex-wrap gap-3">
              {softSkills.map((s) => (
                <span key={s} className="chip text-sm">{s}</span>
              ))}
            </div>
          </Reveal>
        </section>
      </div>
    </div>
  );
}
EOF

# =====================================================  Contact
cat > src/components/ContactForm.tsx <<'EOF'
'use client';

import { useState } from 'react';

interface Props {
  toEmail: string;
}

type Errors = Partial<Record<'name' | 'email' | 'subject' | 'message', string>>;

export default function ContactForm({ toEmail }: Props) {
  const [values, setValues] = useState({ name: '', email: '', subject: '', message: '' });
  const [errors, setErrors] = useState<Errors>({});
  const [sent, setSent] = useState(false);

  const MAX = 500;

  function validate(): Errors {
    const e: Errors = {};
    if (values.name.trim().length < 2) e.name = 'Ingresa tu nombre (mínimo 2 caracteres).';
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(values.email)) e.email = 'Ingresa un correo válido.';
    if (values.subject.trim().length < 3) e.subject = 'Ingresa un asunto (mínimo 3 caracteres).';
    if (values.message.trim().length < 10) e.message = 'El mensaje debe tener al menos 10 caracteres.';
    return e;
  }

  function handleChange(ev: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) {
    const { name, value } = ev.target;
    setValues((v) => ({ ...v, [name]: value }));
    setErrors((er) => ({ ...er, [name]: undefined }));
    setSent(false);
  }

  function handleSubmit(ev: React.FormEvent<HTMLFormElement>) {
    ev.preventDefault();
    const e = validate();
    setErrors(e);
    if (Object.keys(e).length > 0) return;

    const body = `Nombre: ${values.name}\nCorreo: ${values.email}\n\n${values.message}`;
    const url = `mailto:${toEmail}?subject=${encodeURIComponent(values.subject)}&body=${encodeURIComponent(body)}`;
    window.location.href = url;
    setSent(true);
  }

  const label = 'block text-sm font-semibold text-main mb-1';
  const err = { color: 'var(--danger)' };

  return (
    <form onSubmit={handleSubmit} noValidate className="glass p-6 md:p-8 space-y-5">
      <div>
        <label htmlFor="name" className={label}>Nombre</label>
        <input
          id="name" name="name" type="text" autoComplete="name"
          value={values.name} onChange={handleChange}
          aria-invalid={!!errors.name}
          aria-describedby={errors.name ? 'name-error' : undefined}
          className="input"
        />
        {errors.name && <p id="name-error" className="text-sm mt-1" style={err}>{errors.name}</p>}
      </div>

      <div>
        <label htmlFor="email" className={label}>Correo electrónico</label>
        <input
          id="email" name="email" type="email" autoComplete="email"
          value={values.email} onChange={handleChange}
          aria-invalid={!!errors.email}
          aria-describedby={errors.email ? 'email-error' : undefined}
          className="input"
        />
        {errors.email && <p id="email-error" className="text-sm mt-1" style={err}>{errors.email}</p>}
      </div>

      <div>
        <label htmlFor="subject" className={label}>Asunto</label>
        <input
          id="subject" name="subject" type="text"
          value={values.subject} onChange={handleChange}
          aria-invalid={!!errors.subject}
          aria-describedby={errors.subject ? 'subject-error' : undefined}
          className="input"
        />
        {errors.subject && <p id="subject-error" className="text-sm mt-1" style={err}>{errors.subject}</p>}
      </div>

      <div>
        <label htmlFor="message" className={label}>Mensaje</label>
        <textarea
          id="message" name="message" rows={5} maxLength={MAX}
          value={values.message} onChange={handleChange}
          aria-invalid={!!errors.message}
          aria-describedby={errors.message ? 'message-error' : undefined}
          className="input"
        />
        <div className="flex justify-between mt-1">
          {errors.message ? (
            <p id="message-error" className="text-sm" style={err}>{errors.message}</p>
          ) : (
            <span />
          )}
          <span className="text-xs text-muted">{values.message.length}/{MAX}</span>
        </div>
      </div>

      <button type="submit" className="btn btn-primary">Enviar mensaje</button>

      {sent && (
        <p role="status" className="text-sm" style={{ color: 'var(--ok)' }}>
          Se abrió tu aplicación de correo con el mensaje listo para enviar.
          Si no se abrió, escríbeme a {toEmail}.
        </p>
      )}
    </form>
  );
}
EOF

cat > src/app/contact/page.tsx <<'EOF'
import { Metadata } from 'next';
import ContactForm from '@/components/ContactForm';
import Reveal from '@/components/Reveal';
import { personalInfo } from '@/lib/data';

export const metadata: Metadata = {
  title: 'Contacto',
  description: `Contacta con ${personalInfo.name}. Escríbeme para colaborar en proyectos de desarrollo de software.`,
  openGraph: {
    title: `Contacto | ${personalInfo.name}`,
    description: 'Escríbeme para colaborar en proyectos de desarrollo de software',
  },
};

export default function ContactPage() {
  return (
    <div className="container mx-auto px-4 py-12">
      <div className="max-w-2xl mx-auto">
        <h1 className="section-title anim-fade-up text-4xl md:text-5xl font-bold mb-4">
          Contacto
        </h1>
        <p className="anim-fade-up text-muted text-lg mb-8" style={{ animationDelay: '0.15s' }}>
          ¿Tienes un proyecto en mente o quieres conversar? Escríbeme.
        </p>

        <Reveal>
          <ContactForm toEmail={personalInfo.email} />
        </Reveal>

        <Reveal delay={150}>
          <ul className="glass mt-8 p-6 space-y-3 text-main">
            <li>📧 <a className="nav-link" href={`mailto:${personalInfo.email}`}>{personalInfo.email}</a></li>
            <li>📞 {personalInfo.phone}</li>
            <li>📍 {personalInfo.location}</li>
            <li>🔗 <a className="nav-link" href={personalInfo.linkedin} target="_blank" rel="noopener noreferrer">LinkedIn</a></li>
            <li>💻 <a className="nav-link" href={personalInfo.github} target="_blank" rel="noopener noreferrer">GitHub</a></li>
          </ul>
        </Reveal>
      </div>
    </div>
  );
}
EOF

rm -rf .next
echo ""
echo "✅ Rediseño aplicado. Prueba con:  npm run dev -- -p 8080"
