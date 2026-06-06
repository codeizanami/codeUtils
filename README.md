# codeOS Gaming — Script de optimización

> Elimina bloatware, aplica tweaks de red, GPU, CPU y registro para máximo rendimiento en juegos.

Parte del proyecto [codeOS](https://codeOS.codeizanami.es)

---

## ¿Qué hace?

- Elimina bloatware y apps innecesarias de Windows 10
- Desinstala OneDrive completamente
- Desactiva telemetría y diagnósticos de Microsoft
- Configura servicios para máximo rendimiento
- Aplica plan de energía alto rendimiento
- Optimiza TCP/IP y configura DNS Cloudflare 1.1.1.1
- Tweaks de registro: GPU priority, Core Parking, Win32PrioritySeparation
- Desactiva tareas programadas innecesarias
- Optimiza SSD con fsutil
- Limpia temporales y Prefetch
- Guarda log en `C:\codeOS\logs\`

---

## Uso

```powershell
powershell -ExecutionPolicy Bypass -File codeOSGaming.ps1
```

O clic derecho sobre el archivo → **Ejecutar con PowerShell**.

El script se auto-eleva a administrador si no lo es. Al terminar reinicia el sistema automáticamente.

Aviso! No me hago responable de lo que le pase a tu sistema despues de usar este script, utilizalo bajo tu responsabilidad.
---

## Requisitos

- Windows 10 Pro
- PowerShell 5.1 o superior
- Conexión a internet (para DNS)

---

## Notas

- Compatible con codeOS Gaming ISO y con cualquier instalación limpia de Windows 10 Pro.
- El log se guarda en `C:\codeOS\logs\` con fecha y hora.
- Los tweaks de Spectre/Meltdown están comentados por seguridad. Descoméntalos solo en PCs de uso personal estrictamente.

---

*Parte de codeOS · España · 2026*
