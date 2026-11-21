import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  allowedDevOrigins: ['**.cloudshell.dev', '8080-cs-624385661693-default.cs-us-east1-yeah.cloudshell.dev'],
  images: {
    formats: ['image/avif', 'image/webp'],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
    remotePatterns: [
      { protocol: 'https', hostname: '**.unsplash.com' },
    ],
  },
};

export default nextConfig;
