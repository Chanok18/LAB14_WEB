import { Metadata } from 'next';
import Image from 'next/image';
import { personalInfo } from '@/lib/data';

export const metadata: Metadata = {
  title: 'Sobre Mí',
  description: `Conoce más sobre ${personalInfo.name}, ${personalInfo.title}`,
};

export default function AboutPage() {
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

  return (
    <div className="container mx-auto px-4 py-12">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Sobre Mí</h1>

        <div className="grid md:grid-cols-3 gap-8 mb-12">
          <div className="md:col-span-1">
            <div className="relative w-full aspect-square rounded-lg overflow-hidden">
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

          <div className="md:col-span-2">
            <h2 className="text-2xl font-bold text-gray-900 mb-4">
              ¡Hola! Soy {personalInfo.name}
            </h2>
            <div className="prose text-gray-700 space-y-4">
              <p>{personalInfo.description}</p>
              <p>
                Me enfoco en aplicar buenas prácticas de programación, el trabajo
                en equipo y la resolución de problemas. Actualmente fortalezco mis
                habilidades técnicas con proyectos personales y académicos
                colaborativos.
              </p>
              <p>
                <strong>Educación:</strong> TECSUP - Diseño y Desarrollo de
                Software (2024 - Actualidad).
              </p>
              <p>
                <strong>Idiomas:</strong> Inglés nivel intermedio - Británico (en
                curso).
              </p>
              <p>
                <strong>Ubicación:</strong> {personalInfo.location}
              </p>
            </div>
          </div>
        </div>

        <section className="mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">
            Habilidades Técnicas
          </h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {skills.map((skill) => (
              <div
                key={skill}
                className="bg-white p-4 rounded-lg shadow-md text-center hover:shadow-lg transition-shadow"
              >
                <p className="font-semibold text-gray-800">{skill}</p>
              </div>
            ))}
          </div>
        </section>

        <section className="mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-6">
            Habilidades Blandas
          </h2>
          <div className="flex flex-wrap gap-2">
            {['Trabajo en equipo', 'Comunicación efectiva', 'Adaptabilidad', 'Aprendizaje continuo'].map(
              (s) => (
                <span key={s} className="bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm">
                  {s}
                </span>
              )
            )}
          </div>
        </section>
      </div>
    </div>
  );
}
