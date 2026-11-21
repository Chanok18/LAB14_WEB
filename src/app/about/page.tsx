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
