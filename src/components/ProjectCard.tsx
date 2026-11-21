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
