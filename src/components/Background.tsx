const orbs = [
  { l: '8%', t: '18%', s: 36, d: 0 },
  { l: '86%', t: '20%', s: 46, d: 2 },
  { l: '93%', t: '62%', s: 60, d: 1 },
  { l: '4%', t: '70%', s: 28, d: 3 },
  { l: '20%', t: '40%', s: 16, d: 1.5 },
  { l: '78%', t: '48%', s: 14, d: 2.5 },
];

const cubes = [
  { l: '3%', t: '12%', s: 64, d: 0 },
  { l: '90%', t: '28%', s: 100, d: 1 },
  { l: '14%', t: '78%', s: 54, d: 2 },
  { l: '80%', t: '82%', s: 70, d: 3 },
];

export default function Background() {
  return (
    <div className="scene" aria-hidden="true">
      {Array.from({ length: 22 }).map((_, i) => (
        <span
          key={`s${i}`}
          className="star"
          style={{
            left: `${(i * 37 + 11) % 100}%`,
            top: `${(i * 53 + 7) % 100}%`,
            animationDelay: `${(i % 7) * 0.5}s`,
          }}
        />
      ))}
      {orbs.map((o, i) => (
        <span
          key={`o${i}`}
          className="orb"
          style={{ left: o.l, top: o.t, width: o.s, height: o.s, animationDelay: `${o.d}s` }}
        />
      ))}
      {cubes.map((c, i) => (
        <span
          key={`c${i}`}
          className="cube hidden md:block"
          style={{ left: c.l, top: c.t, width: c.s, height: c.s, animationDelay: `${c.d}s` }}
        />
      ))}
    </div>
  );
}
