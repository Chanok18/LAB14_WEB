import { Metadata } from 'next';
import ContactForm from '@/components/ContactForm';
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
        <h1 className="text-4xl font-bold text-gray-900 mb-4">Contacto</h1>
        <p className="text-lg text-gray-600 mb-8">
          ¿Tienes un proyecto en mente o quieres conversar? Escríbeme.
        </p>

        <ContactForm toEmail={personalInfo.email} />

        <ul className="mt-8 space-y-2 text-gray-700">
          <li>📧 <a className="text-blue-600 hover:underline" href={`mailto:${personalInfo.email}`}>{personalInfo.email}</a></li>
          <li>📞 {personalInfo.phone}</li>
          <li>📍 {personalInfo.location}</li>
          <li>🔗 <a className="text-blue-600 hover:underline" href={personalInfo.linkedin} target="_blank" rel="noopener noreferrer">LinkedIn</a></li>
          <li>💻 <a className="text-blue-600 hover:underline" href={personalInfo.github} target="_blank" rel="noopener noreferrer">GitHub</a></li>
        </ul>
      </div>
    </div>
  );
}
