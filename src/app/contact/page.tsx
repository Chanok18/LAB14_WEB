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
