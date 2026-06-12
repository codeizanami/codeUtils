<div align="center">

<br/>

```
  ██████╗ ██████╗ ██████╗ ███████╗██╗   ██╗████████╗██╗██╗     ███████╗
 ██╔════╝██╔═══██╗██╔══██╗██╔════╝██║   ██║╚══██╔══╝██║██║     ██╔════╝
 ██║     ██║   ██║██║  ██║█████╗  ██║   ██║   ██║   ██║██║     ███████╗
 ██║     ██║   ██║██║  ██║██╔══╝  ██║   ██║   ██║   ██║██║     ╚════██║
 ╚██████╗╚██████╔╝██████╔╝███████╗╚██████╔╝   ██║   ██║███████╗███████║
  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝
```

**Gaming PC Optimization Suite**

[![Release](https://img.shields.io/github/v/release/codeizanami/codeUtils?style=flat-square&color=6366f1&labelColor=0d0d0f&label=versión)](https://github.com/codeizanami/codeUtils/releases)
[![Platform](https://img.shields.io/badge/plataforma-Windows%2010%20Pro-6366f1?style=flat-square&labelColor=0d0d0f)](https://github.com/codeizanami/codeUtils)
[![License](https://img.shields.io/badge/licencia-Apache%202.0-6366f1?style=flat-square&labelColor=0d0d0f)](https://www.apache.org/licenses/LICENSE-2.0)
[![Made in Spain](https://img.shields.io/badge/hecho%20en-España%20🇪🇸-6366f1?style=flat-square&labelColor=0d0d0f)](https://codeizanami.es)

<br/>

> Tweaks de rendimiento, limpieza de bloatware e instalador de apps.<br/>
> **Una sola herramienta. Sin código expuesto. Sin instalador.**

<br/>

**[⬇ Descargar .exe](https://github.com/codeizanami/codeUtils/releases/latest)** · **[🌐 Web del proyecto](https://codeizanami.es)** · **[📦 codeOS](https://codeOS.codeizanami.es)**

<br/>

</div>

---

## ¿Qué es codeUtils?

**codeUtils** es la herramienta de optimización oficial del proyecto [codeOS](https://codeOS.codeizanami.es). Distribuida como un único `.exe` autocontenido, no requiere instalación, no expone su código fuente y se auto-eleva a administrador al ejecutarse.

Diseñada para sacar el máximo rendimiento de un PC gaming con Windows 10 Pro, con un sistema modular donde el usuario elige exactamente qué se aplica.

```
  codeUtils.exe  →  doble clic  →  listo
  ─────────────────────────────────────────
  sin instalador · sin dependencias · sin código fuente
```

---

## Descarga

> **El código fuente no está disponible públicamente.**
> codeUtils se distribuye exclusivamente como binario compilado.

```
  Última versión estable → Releases → codeUtils.exe
```

[![Descargar](https://img.shields.io/badge/⬇%20%20Descargar%20codeUtils.exe-6366f1?style=for-the-badge&labelColor=0d0d0f)](https://github.com/codeizanami/codeUtils/releases/latest)


---

## Módulos disponibles

codeUtils está organizado en **pestañas** con módulos seleccionables individualmente. Cada módulo muestra su nivel de impacto antes de ejecutarse.

### ⚙️ Tweaks — Optimización del sistema

Los tweaks se clasifican por impacto con un sistema de colores:

| Color | Nivel | Tipo de cambio |
|:---:|:---:|:---|
| 🔴 | **ALTO** | Kernel, GPU priority, CPU scheduling, pagefile |
| 🟡 | **MEDIO** | Red, servicios, drivers, bloatware |
| 🟢 | **BAJO** | Privacidad, telemetría, limpieza visual |

**Rendimiento**
- `🔴` Prioridad CPU/GPU via MMCSS · Win32PrioritySeparation · Core Parking OFF
- `🔴` Plan de energía Alto Rendimiento · Hibernación desactivada
- `🔴` SvcHostSplitThresholdInKB ajustado a la RAM del sistema
- `🔴` Memoria y paginación — DisablePagingExecutive, LargeSystemCache
- `🔴` SysMain / Superfetch — desactivado en SSDs rápidos
- `🟡` Fullscreen Optimizations (FSO) desactivado globalmente
- `🔴` ⚠ Mitigaciones Spectre/Meltdown — solo para uso personal estricto

**Red y Latencia**
- `🔴` TCP/IP Anti-Lag Suite — TcpAckFrequency, TCPNoDelay, CTCP, ECN, RSS
- `🟡` DNS Cloudflare 1.1.1.1 / 1.0.0.1 en todos los adaptadores
- `🟡` Teredo IPv6 desactivado · IPv4 preferido

**Privacidad y Telemetría**
- `🟡` Telemetría completa — AdvertisingInfo, DiagTrack, TIPC, InputPersonalization
- `🟢` Historial de actividad, rastreo de ubicación, Consumer Features
- `🟢` Debloat de Microsoft Edge via GPO · Telemetría de PowerShell 7

**Servicios**
- `🟡` DiagTrack, dmwappushservice, WSearch, XblAuthManager, MapsBroker → Disabled
- `🟡` Tareas programadas de diagnóstico — CEIP, DiskDiag, AppraiserReport
- `🟡` Apps en segundo plano, Storage Sense

**Bloatware**
- `🟡` Purga de apps preinstaladas — Bing, Solitaire, SkypeApp, Teams, YourPhone, etc.
- `🟢` OneDrive — desinstalación completa + bloqueo GPO
- `🟢` Widgets de Windows
- `🟡` ⚠ Componentes Xbox — **incompatible con Xbox Game Pass en PC.** Elimina XboxIdentityProvider, GamingApp y Xbox.TCUI, que son necesarios para autenticar y lanzar juegos del Game Pass. No actives este módulo si usas Game Pass.

**Gaming**
- `🔴` Game DVR / Xbox Capture desactivado — elimina stuttering por captura en background
- `🟢` End Task directo desde la barra de tareas · Bloqueo de driver updates automáticos
- `🟢` WPBT desactivado

**Disco**
- `🟡` DisableLastAccess · EncryptPagingFile=0 · Limpieza de temporales y Prefetch
- `🟢` Limpieza de disco + DISM ResetBase

---

### 📦 Instalar Apps

Instalador integrado con catálogo de +80 aplicaciones via **winget**, agrupadas por categoría.

| Categoría | Apps destacadas |
|:---|:---|
| 🎮 Gaming | Steam, Epic Games, GOG, EA App, Ubisoft Connect, emuladores |
| 🌐 Navegadores | Chrome, Firefox, Brave, Vivaldi, LibreWolf, Tor Browser |
| 💬 Comunicación | Discord, Vesktop, Telegram, Signal, TeamSpeak 3 |
| 🛠️ Utilidades | 7-Zip, PowerToys, WizTree, Bitwarden, Process Lasso, OpenRGB |
| 🎵 Multimedia | VLC, Spotify, OBS Studio, GIMP, Audacity, Blender |
| 💻 Desarrollo | VS Code, Git, Node.js LTS, Python 3, JetBrains Toolbox |
| 🔧 Pro / Hardware | HWiNFO, MSI Afterburner, GPU-Z, DDU, NVCleanstall, Wireshark |
| 🔒 Runtimes | VCRedist 2015+ x64/x86, .NET 8/9, DirectX |

Incluye **buscador en tiempo real** y presets de selección rápida: `Gaming`, `Dev`, `Todo`, `Nada`.

---

### 🔄 Windows Update

Control total sobre Windows Update con advertencias claras sobre las implicaciones de desactivarlo.

> ⚠️ **Desactivar Windows Update expone el sistema a vulnerabilidades de seguridad.**
> Úsalo solo en PCs gaming dedicados que no sean tu máquina principal de trabajo.

- Desactivar — bloquea wuauserv, UsoSvc, WaaSMedicSvc via servicios y GPO
- Reactivar — revierte todos los cambios limpiamente
- Estado en tiempo real del servicio

---

## Seguridad y uso

```
  ┌─────────────────────────────────────────────────────────────────┐
  │  codeUtils se ejecuta con privilegios de Administrador.         │
  │  Crea un punto de restauración automáticamente antes de         │
  │  aplicar cualquier cambio (activado por defecto).               │
  │                                                                 │
  │  Los módulos marcados como ⚠ RIESGO muestran una advertencia    │
  │  de confirmación antes de ejecutarse.                           │
  └─────────────────────────────────────────────────────────────────┘
```

**Requisitos**
- Windows 10 Pro (compatible con instalaciones limpias y con codeOS Gaming ISO)
- No requiere instalación adicional
- Conexión a Internet para el instalador de apps (winget)

> **Aviso legal:** Este software se distribuye bajo la licencia [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), que excluye expresamente cualquier garantía y limita la responsabilidad del autor. Úsalo bajo tu propia responsabilidad y criterio.

---

## Parte del proyecto codeOS

```
  codeOS
  ├── codeOS Gaming ISO    — Instalación desatendida de Windows 10 gaming
  ├── codeOS Estudio ISO   — Instalación para trabajo y producción
  ├── codeOS Server ISO    — Instalación para servidor
  └── codeUtils            — esta herramienta
```

**[🌐 codeizanami.es](https://codeizanami.es)** · **[📦 codeOS](https://codeOS.codeizanami.es)**

---

<div align="center">

*codeizanami · España · 2026*

</div>
