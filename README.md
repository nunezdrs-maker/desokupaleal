# DESOKUPA - Web de Recuperación Legal de Inmuebles

[![Deploy to Fly.io](https://github.com/tu-usuario/desokupa-web/actions/workflows/deploy.yml/badge.svg)](https://github.com/tu-usuario/desokupa-web/actions/workflows/deploy.yml)
[![License](https://img.shields.io/badge/license-Proprietary-blue.svg)](LICENSE)
[![Made with React](https://img.shields.io/badge/Made%20with-React-61DAFB?logo=react)](https://reactjs.org/)
[![Deployed on Fly.io](https://img.shields.io/badge/Deployed%20on-Fly.io-7B3FF2?logo=fly.io&logoColor=white)](https://fly.io)

Sitio web profesional para DESOKUPACIÓN LEAL, empresa especializada en la recuperación legal de inmuebles okupados.

> 🎯 **¿Primera vez aquí?** Lee [START-HERE.md](./START-HERE.md) para empezar

---

## 📚 Documentación

### 🎯 Inicio Rápido
- 📋 **[SETUP SUMMARY](./SETUP-SUMMARY.md)** - ⭐ Resumen ejecutivo (empieza aquí)
- 🚀 **[Quick Start Guide](./QUICKSTART.md)** - Guía paso a paso (10 minutos)

### 🚢 Despliegue
- 🤖 **[GitHub Deploy](./GITHUB-DEPLOY.md)** - Deploy automático desde GitHub (recomendado)
- 📦 **[Manual Deploy](./DEPLOY.md)** - Deploy manual y configuración avanzada

### 📊 Optimización y QA
- ⚡ **[Optimizations](./OPTIMIZATIONS.md)** - Performance y mejores prácticas
- ✅ **[Post-Deploy Checklist](./POST-DEPLOY.md)** - Verificación completa

### 🛠️ Scripts de Setup

```bash
# Dar permisos de ejecución
chmod +x scripts/*.sh

# Setup completo automatizado
./scripts/first-deploy.sh

# O configuración paso a paso
./scripts/setup.sh
```

## 🚀 Características

- ✅ Diseño responsive y moderno
- ✅ Sistema de reservas con calendario integrado
- ✅ Envío de emails automatizado con Resend
- ✅ SEO optimizado con meta tags y structured data
- ✅ Testimonios de clientes con carrusel interactivo
- ✅ Secciones completas: Hero, Servicios, Método, Casos de Éxito, etc.
- ✅ Integración con Supabase para backend
- ✅ Deploy automático en Fly.io

## 🛠️ Tecnologías

- **Frontend**: React 18 + TypeScript
- **Styling**: Tailwind CSS 4.0
- **Build Tool**: Vite
- **Backend**: Supabase Edge Functions
- **Email**: Resend API
- **Hosting**: Fly.io
- **UI Components**: shadcn/ui

## 📦 Instalación Local

1. **Clonar el repositorio**
   ```bash
   git clone <tu-repositorio>
   cd desokupa-web
   ```

2. **Instalar dependencias**
   ```bash
   npm install
   ```

3. **Configurar variables de entorno**
   ```bash
   cp .env.example .env
   # Edita .env con tus credenciales
   ```

4. **Ejecutar en desarrollo**
   ```bash
   npm run dev
   ```

5. **Abrir en el navegador**
   ```
   http://localhost:3000
   ```

## 🌐 Despliegue en Fly.io

### 🚀 Quick Start (10 minutos)

Ver guía rápida: [QUICKSTART.md](./QUICKSTART.md)

### 🤖 Deploy Automático desde GitHub (Recomendado)

```bash
# 1. Subir a GitHub
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/tu-usuario/desokupa-web.git
git push -u origin main

# 2. Configurar Fly.io
fly auth login
fly launch --no-deploy
fly secrets set SUPABASE_URL="https://xxxxx.supabase.co"
fly secrets set SUPABASE_ANON_KEY="tu-key"
fly secrets set SUPABASE_SERVICE_ROLE_KEY="tu-key"
fly secrets set SUPABASE_DB_URL="postgresql://..."
fly secrets set RESEND_API_KEY="tu-key"

# 3. Obtener token para GitHub
fly auth token

# 4. Agregar FLY_API_TOKEN a GitHub Secrets
# Settings → Secrets and variables → Actions → New repository secret

# 5. ¡Push y listo!
git push origin main
```

**Cada push a `main` desplegará automáticamente** 🎉

Ver guía completa: [DEPLOY.md](./DEPLOY.md)

## 📁 Estructura del Proyecto

```
desokupa-web/
├── src/
│   └── main.tsx              # Entry point
├── App.tsx                   # Componente principal
├── components/
│   ├── Hero.tsx             # Sección hero con stats
│   ├── WhyChooseUs.tsx      # Por qué elegirnos
│   ├── Services.tsx         # Servicios diferenciados
│   ├── Method.tsx           # Método 4 pasos
│   ├── SuccessCases.tsx     # Testimonios
│   ├── AboutUs.tsx          # Quiénes somos
│   ├── Resources.tsx        # Recursos y normativa
│   ├── BookingSection.tsx   # Calendario de reservas
│   ├── Footer.tsx           # Footer completo
│   ├── SEO.tsx              # Meta tags y SEO
│   └── ui/                  # Componentes shadcn/ui
├── supabase/
│   └── functions/
│       └── server/          # Edge functions
├── styles/
│   └── globals.css          # Estilos globales
├── public/
│   ├── sitemap.xml          # Sitemap SEO
│   ├── robots.txt           # Robots SEO
│   └── favicon.svg          # Favicon
├── Dockerfile               # Docker config
├── fly.toml                 # Fly.io config
└── DEPLOY.md                # Guía de despliegue
```

## 🎨 Colores de Marca

- **Amarillo/Dorado**: `#fbbf24` (brand)
- **Gris Oscuro**: `#1e293b` (slate-900)
- **Blanco**: `#ffffff`

## 📧 Configuración de Email

El sistema usa Resend para enviar emails de confirmación de citas a `gestion@desokupacionleal.es`.

**Requisitos:**
1. Cuenta en Resend (https://resend.com)
2. Dominio verificado
3. API Key configurada

## 🔧 Scripts Disponibles

```bash
npm run dev      # Desarrollo local
npm run build    # Build de producción
npm run preview  # Preview del build
```

## 🚀 Desplegar Edge Functions

Las Supabase Edge Functions se despliegan por separado:

```bash
# Instalar Supabase CLI
npm install -g supabase

# Login y link
supabase login
supabase link --project-ref tu-project-ref

# Deploy functions
supabase functions deploy server
```

## 📱 Responsive Design

La web es completamente responsive:
- 📱 Mobile: 320px - 767px
- 📱 Tablet: 768px - 1023px
- 💻 Desktop: 1024px+

## ⚡ Performance

- ✅ Lazy loading de componentes
- ✅ Optimización de imágenes
- ✅ Code splitting automático
- ✅ CSS minificado
- ✅ Assets optimizados

## 🔒 Seguridad

- ✅ HTTPS automático con Fly.io
- ✅ Variables de entorno seguras
- ✅ CORS configurado correctamente
- ✅ Validación de formularios

## 📈 SEO

- ✅ Meta tags optimizados
- ✅ Open Graph tags
- ✅ Schema.org structured data
- ✅ Sitemap.xml
- ✅ Robots.txt
- ✅ URLs semánticas

## 🐛 Troubleshooting

### La app no conecta con Supabase
- Verifica las variables de entorno en Fly.io: `fly secrets list`

### Error en el build
- Revisa los logs: `fly logs`
- Verifica que todas las dependencias estén instaladas

### Email no se envía
- Verifica que el dominio esté verificado en Resend
- Comprueba la API key: `fly secrets list`

## 📞 Soporte

- **Email**: gestion@desokupacionleal.es
- **Documentación Fly.io**: https://fly.io/docs/
- **Documentación Supabase**: https://supabase.com/docs

## 📄 Licencia

Copyright © 2025 DESOKUPACIÓN LEAL. Todos los derechos reservados.
