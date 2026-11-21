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
