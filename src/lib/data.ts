import { Project } from '@/types';

export const projects: Project[] = [
  {
    slug: 'aloja',
    title: 'Aloja',
    description:
      'Plataforma web de reservas y publicación de alojamientos.',
    highlights: [
      'Desarrollo de módulos de autenticación, hospedajes, reservas, pagos y reseñas.',
      'Implementación de operaciones CRUD y gestión de usuarios por roles.',
      'Uso de Git y GitHub para el control de versiones y el trabajo colaborativo.',
    ],
    image:
      '/aloja.png',
    technologies: ['Autenticación', 'Reservas', 'Pagos', 'CRUD', 'Roles', 'Git'],
    featured: true,
  },
  {
    slug: 'liga-1-pro',
    title: 'Liga 1 Pro',
    description:
      'Plataforma web full-stack sobre la Liga 1 del Perú, con chat en tiempo real y predicciones con IA.',
    highlights: [
      'API REST con arquitectura en capas, autenticación JWT y control de roles.',
      'Chat en tiempo real y predicciones de partidos integrando IA.',
      'Manejo de Git para el trabajo colaborativo.',
    ],
    image:
      '/liga1pro.png',
    technologies: ['API REST', 'JWT', 'Tiempo real', 'IA', 'Full-stack', 'Git'],
    featured: true,
  },
  {
    slug: 'ivera-inventario',
    title: 'IVERA - Inventario centralizado',
    description:
      'Proyecto de tesis: sistema de inventario centralizado para las ferreterías Romel y Todopernos.',
    highlights: [
      'Aplicación web y aplicación móvil en la nube para centralizar y gestionar el inventario de dos ferreterías con RUC independientes que comparten un almacén central.',
      'Integra la información de ambas tiendas y del almacén, permitiendo consultar y actualizar el stock en tiempo casi real.',
      'Funcionalidad diferenciadora: control de inventario móvil mediante lectura de códigos de barras para registrar, consultar y actualizar productos.',
    ],
    image:
      '/ivera.png',
    technologies: ['App web', 'App móvil', 'Nube', 'Códigos de barras', 'Inventario'],
    featured: true,
  },
];

export const personalInfo = {
  name: 'Kevin Quispe Ccolque',
  title: 'Estudiante de Diseño y Desarrollo de Software',
  description:
    'Estudiante de Diseño y Desarrollo de Software con interés en el desarrollo backend de aplicaciones web y móviles. Experiencia en proyectos académicos con Java, Laravel, PHP, Kotlin, MySQL y Firebase.',
  email: 'kevquispecc@gmail.com',
  phone: '950 353 972',
  location: 'Cieneguilla, Lima, Perú',
  github: 'https://github.com/Chanok18',
  linkedin: 'https://linkedin.com/in/kevin-quispe-0131b1354',
  // En Vercel define la variable NEXT_PUBLIC_SITE_URL con tu dominio final (sin "/" al final)
  siteUrl: process.env.NEXT_PUBLIC_SITE_URL ?? 'http://localhost:3000',
  avatar:
    '/perfil.png',
};
