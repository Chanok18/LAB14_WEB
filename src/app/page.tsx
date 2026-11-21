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
