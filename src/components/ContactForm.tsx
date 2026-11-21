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

  function handleChange(
    ev: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) {
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

  const input =
    'w-full border border-gray-300 rounded-lg px-4 py-2 text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500';

  return (
    <form
      onSubmit={handleSubmit}
      noValidate
      className="bg-white p-6 rounded-lg shadow-md space-y-5"
    >
      <div>
        <label htmlFor="name" className="block text-sm font-semibold text-gray-800 mb-1">
          Nombre
        </label>
        <input
          id="name"
          name="name"
          type="text"
          autoComplete="name"
          value={values.name}
          onChange={handleChange}
          aria-invalid={!!errors.name}
          aria-describedby={errors.name ? 'name-error' : undefined}
          className={input}
        />
        {errors.name && (
          <p id="name-error" className="text-sm text-red-600 mt-1">{errors.name}</p>
        )}
      </div>

      <div>
        <label htmlFor="email" className="block text-sm font-semibold text-gray-800 mb-1">
          Correo electrónico
        </label>
        <input
          id="email"
          name="email"
          type="email"
          autoComplete="email"
          value={values.email}
          onChange={handleChange}
          aria-invalid={!!errors.email}
          aria-describedby={errors.email ? 'email-error' : undefined}
          className={input}
        />
        {errors.email && (
          <p id="email-error" className="text-sm text-red-600 mt-1">{errors.email}</p>
        )}
      </div>

      <div>
        <label htmlFor="subject" className="block text-sm font-semibold text-gray-800 mb-1">
          Asunto
        </label>
        <input
          id="subject"
          name="subject"
          type="text"
          value={values.subject}
          onChange={handleChange}
          aria-invalid={!!errors.subject}
          aria-describedby={errors.subject ? 'subject-error' : undefined}
          className={input}
        />
        {errors.subject && (
          <p id="subject-error" className="text-sm text-red-600 mt-1">{errors.subject}</p>
        )}
      </div>

      <div>
        <label htmlFor="message" className="block text-sm font-semibold text-gray-800 mb-1">
          Mensaje
        </label>
        <textarea
          id="message"
          name="message"
          rows={5}
          maxLength={MAX}
          value={values.message}
          onChange={handleChange}
          aria-invalid={!!errors.message}
          aria-describedby={errors.message ? 'message-error' : undefined}
          className={input}
        />
        <div className="flex justify-between mt-1">
          {errors.message ? (
            <p id="message-error" className="text-sm text-red-600">{errors.message}</p>
          ) : (
            <span />
          )}
          <span className="text-xs text-gray-500">{values.message.length}/{MAX}</span>
        </div>
      </div>

      <button
        type="submit"
        className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition"
      >
        Enviar mensaje
      </button>

      {sent && (
        <p role="status" className="text-sm text-green-700">
          Se abrió tu aplicación de correo con el mensaje listo para enviar.
          Si no se abrió, escríbeme a {toEmail}.
        </p>
      )}
    </form>
  );
}
