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
[![Platform](https://img.shields.io/badge/plataforma-Windows%2010%20%7C%2011-6366f1?style=flat-square&labelColor=0d0d0f)](https://github.com/codeizanami/codeUtils)
[![License](https://img.shields.io/badge/licencia-Apache%202.0-6366f1?style=flat-square&labelColor=0d0d0f)](https://www.apache.org/licenses/LICENSE-2.0)
[![Made in Spain](https://img.shields.io/badge/hecho%20en-España%20🇪🇸-6366f1?style=flat-square&labelColor=0d0d0f)](https://codeizanami.es)

<br/>

> Tweaks de rendimiento, limpieza de bloatware e instalador de apps — con vuelta atrás.<br/>
> **Una sola herramienta. Windows 10 y 11. Sin instalador.**

<br/>

**[⬇ Descargar .exe](https://github.com/codeizanami/codeUtils/releases/latest)** · **[🌐 Web del proyecto](https://codeizanami.es)** · **[📦 codeOS](https://codeOS.codeizanami.es)**

<br/>

</div>

---

## ¿Qué es codeUtils?

**codeUtils** es la herramienta de optimización oficial del proyecto [codeOS](https://codeOS.codeizanami.es). Se distribuye como un único `.exe` autocontenido: no requiere instalación y se auto-eleva a administrador al ejecutarse.

Está pensada para sacar el máximo rendimiento de un PC gaming con **Windows 10 o Windows 11**. Detecta automáticamente tu versión de Windows y solo muestra los módulos que aplican a tu sistema. Tú eliges exactamente qué se aplica, y casi todo se puede revertir después.

```
  codeUtils.exe  →  doble clic  →  listo
  ─────────────────────────────────────────
  sin instalador · sin dependencias · W10 / W11 auto-detectado
```

---

## Descarga

> **El código fuente no está disponible públicamente.**
> codeUtils se distribuye exclusivamente como binario compilado.

```
  Última versión estable → Releases → codeUtils.exe
```

[![Descargar](https://img.shields.io/badge/⬇%20%20Descargar%20codeUtils.exe-6366f1?style=for-the-badge&labelColor=0d0d0f)](https://github.com/codeizanami/codeUtils/releases/latest)

El `.exe` está firmado con un certificado propio (`CN=codeizanami codeUtils`). Al no ser de una autoridad comercial, Windows SmartScreen puede mostrar un aviso la primera vez. Puedes verificar la firma con el certificado público de [`codesign/codeUtils-publisher.cer`](codesign/codeUtils-publisher.cer).

---

## Módulos disponibles

codeUtils está organizado en **pestañas** con módulos seleccionables individualmente. Cada módulo muestra su nivel de impacto antes de ejecutarse.

### ⚙️ Tweaks — Optimización del sistema

Empieza con un **perfil** y ajusta a mano lo que quieras:

| Perfil | Qué incluye |
|:---|:---|
| **Estándar** | Nada — punto de partida limpio, valores de Windows |
| **Mínimo** | Tweaks seguros de bajo impacto |
| **Limpio** | Selección recomendada y equilibrada |
| **Máximo** | Todo lo orientado a rendimiento gaming |

También puedes **guardar tus propios perfiles** con la combinación de módulos que uses siempre.

Los tweaks se clasifican por impacto con un sistema de colores:

| Color | Nivel | Tipo de cambio |
|:---:|:---:|:---|
| 🔴 | **ALTO** | Kernel, GPU priority, CPU scheduling, pagefile |
| 🟡 | **MEDIO** | Red, servicios, drivers, bloatware |
| 🟢 | **BAJO** | Privacidad, telemetría, limpieza visual |

Los módulos marcados con **⚠ RIESGO** piden confirmación antes de aplicarse.

**Rendimiento**
- `🔴` Prioridad CPU/GPU via MMCSS · Win32PrioritySeparation · Core Parking OFF
- `🔴` Plan de energía — Alto Rendimiento (W10) / Ultimate Performance (W11) · Hibernación desactivada
- `🔴` SvcHostSplitThresholdInKB ajustado a la RAM del sistema
- `🔴` Memoria y paginación — DisablePagingExecutive, LargeSystemCache
- `🔴` SysMain / Superfetch y Windows Search desactivados (recomendado en SSD NVMe + 16 GB RAM)
- `🟡` Fullscreen Optimizations (FSO) desactivado globalmente
- `🔴` ⚠ Mitigaciones Spectre/Meltdown — solo para uso personal estricto
- `🔴` ⚠ VBS desactivado *(W11)* · HPET desactivado *(W11)*

**Red y Latencia**
- `🔴` TCP/IP Anti-Lag Suite — TcpAckFrequency, TCPNoDelay, CTCP, ECN, RSS
- `🟡` DNS Cloudflare 1.1.1.1 / 1.0.0.1 en todos los adaptadores activos *(incluye VPN)*
- `🟡` Teredo IPv6 desactivado · IPv4 preferido

**Privacidad y Telemetría**
- `🟡` Telemetría — AllowTelemetry, AdvertisingInfo, DiagTrack, Error Reporting, InputPersonalization
- `🟢` Historial de actividad, rastreo de ubicación, Consumer Features
- `🟢` Debloat de Microsoft Edge via GPO · Telemetría de PowerShell 7
- `🟢` Copilot desactivado *(W11)*

> La protección de Microsoft Defender **no se toca**: el envío de muestras a la nube sigue activo.

**Servicios**
- `🟡` DiagTrack, dmwappushservice, MapsBroker, RetailDemo, servicios Xbox Live → Disabled
- `🟡` Tareas programadas de diagnóstico — CEIP, DiskDiagnostic, Appraiser, QueueReporting
- `🟡` Apps en segundo plano · `🟢` Storage Sense

**Bloatware**
- `🟡` Purga de apps preinstaladas — BingNews, Solitaire, YourPhone, Teams personal, TikTok, Netflix… (lista adaptada a W10 / W11)
- `🟢` OneDrive — desinstalación + bloqueo GPO. **Tu carpeta OneDrive y tus archivos no se borran.**
- `🟢` Widgets (W10: eliminar · W11: desactivar) · Teams Chat de la taskbar *(W11)*
- `🟢` ⚠ Windows AI / Copilot / Recall — eliminar
- `🟡` ⚠ Componentes Xbox — **incompatible con Xbox Game Pass en PC.** Elimina XboxIdentityProvider, GamingApp y Xbox.TCUI, necesarios para autenticar y lanzar juegos del Game Pass. No actives este módulo si usas Game Pass.

**Gaming y escritorio**
- `🔴` Game DVR / Xbox Capture desactivado — elimina stuttering por captura en background
- `🟢` End Task directo desde la barra de tareas · Bloqueo de driver updates automáticos
- `🟢` ⚠ WPBT desactivado
- `🟢` Menú contextual clásico · Sin recomendaciones en Inicio · Sin Snap Suggestions *(W11)*

**Disco**
- `🟡` DisableLastAccess · EncryptPagingFile=0
- `🟢` Limpieza de temporales (%TEMP% y Windows\Temp)
- `🟢` Limpieza de disco + DISM ResetBase
- `🟢` Explorador — quita "Objetos 3D" y el icono People *(W10)*

---

### ↺ Revertir cambios

Cada vez que aplicas tweaks, codeUtils guarda el **valor original** de cada clave de registro y servicio que modifica. Puedes deshacerlo de dos formas:

- **Por módulo** — marca los módulos y pulsa **↺ Revertir** junto a *Aplicar* (con doble confirmación).
- **Por sesión** — desde la pestaña **Historial**, botón **↺ Revertir** en cualquier aplicación anterior.

Aunque apliques el mismo módulo varias veces, se restaura el valor que había **antes** de que codeUtils lo tocara por primera vez.

> **No se revierten automáticamente:** desinstalaciones de apps, limpieza de disco y temporales, cambios BCDEdit (VBS, HPET), DNS, ajustes netsh/TCP, plan de energía, fsutil, tareas programadas, menú contextual clásico y carpeta Objetos 3D.
> Para esos casos está el **punto de restauración** que se crea antes de aplicar.

---

### 📦 Instalar Apps

Instalador integrado con un catálogo de apps orientadas a gaming via **winget**, agrupadas por categoría.

| Categoría | Apps |
|:---|:---|
| 🎮 Launchers | Steam, Epic Games, GOG Galaxy, EA App, Ubisoft Connect, Battle.net |
| 🖥️ Rendimiento y Monitoreo | MSI Afterburner, HWiNFO, GPU-Z, CPU-Z, HWMonitor, NVCleanstall, DDU, Process Lasso, CrystalDiskInfo |
| 🎧 Comunicación | Discord, Vesktop, TeamSpeak 3 |
| 🕹️ Emuladores | Cemu, Dolphin, PCSX2, RPCS3, Prism Launcher, Modrinth |
| 🎬 Streaming y Captura | OBS Studio, Parsec |
| 🔒 Runtimes | VCRedist 2015+ x64/x86, DirectX, .NET 8 Desktop |

Incluye **buscador en tiempo real** y selección rápida: `Gaming`, `Todo`, `Nada`.

---

### 🔄 Windows Update

Control sobre Windows Update con advertencias claras sobre las implicaciones de desactivarlo.

> ⚠️ **Desactivar Windows Update expone el sistema a vulnerabilidades de seguridad.**
> Úsalo solo en PCs gaming dedicados que no sean tu máquina principal de trabajo.

- **Desactivar** — bloquea wuauserv, UsoSvc y WaaSMedicSvc via servicios y GPO
- **Reactivar** — elimina las políticas y devuelve los servicios a sus valores por defecto de Windows
- Estado actual del servicio

---

### 🕘 Historial

Registro de todo lo que haces con codeUtils — tweaks aplicados, apps instaladas y cambios de Windows Update — con fecha y hora, y botón para revertir cada sesión de tweaks.

---

## Seguridad y uso

```
  ┌─────────────────────────────────────────────────────────────────┐
  │  codeUtils se ejecuta con privilegios de Administrador.         │
  │                                                                 │
  │  Crea un punto de restauración antes de aplicar cambios         │
  │  (activado por defecto). Si no se puede crear, no se aplica     │
  │  nada.                                                          │
  │                                                                 │
  │  Los módulos marcados como ⚠ RIESGO muestran una advertencia    │
  │  de confirmación antes de ejecutarse.                           │
  │                                                                 │
  │  Casi todos los cambios se pueden revertir desde la propia app. │
  └─────────────────────────────────────────────────────────────────┘
```

**Requisitos**
- Windows 10 o Windows 11 de 64 bits (compatible con instalaciones limpias y con codeOS Gaming ISO)
- No requiere instalación adicional
- Conexión a Internet y **winget** (App Installer) para el instalador de apps

**Idioma:** español e inglés — se detecta automáticamente y se puede cambiar desde la cabecera.

> **Aviso legal:** Este software se distribuye bajo la licencia [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), que excluye expresamente cualquier garantía y limita la responsabilidad del autor. Úsalo bajo tu propia responsabilidad y criterio.

---

## Parte del proyecto codeOS

```
  codeOS
  ├── codeOS Gaming ISO    — Instalación desatendida de Windows 10 gaming
  ├── codeOS MAX           — Próximamente.
  └── codeUtils            — esta herramienta
```

**[🌐 codeizanami.es](https://codeizanami.es)** · **[📦 codeOS](https://codeOS.codeizanami.es)**

---

<div align="center">

*codeizanami · España · 2026*

</div>

