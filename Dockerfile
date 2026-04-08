FROM node:22-slim
WORKDIR /app

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/emdash-cms/emdash.git .
RUN pnpm install && pnpm run build

EXPOSE 4321
WORKDIR /app/demos/simple
CMD ["pnpm", "run", "dev", "--host"]