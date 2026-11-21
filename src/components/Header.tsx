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
