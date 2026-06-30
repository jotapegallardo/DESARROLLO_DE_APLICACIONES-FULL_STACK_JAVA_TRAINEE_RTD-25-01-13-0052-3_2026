<!-- vista previa: Ctrl+Shift+V -->
# MySQL en Windows (Server + Workbench)

Referencia (descargas):  
https://www.mysql.com/downloads/

---

## Qué necesitas

- **MySQL Server** (https://dev.mysql.com/downloads/installer/) → el motor de base de datos.
- **MySQL Workbench** (https://www.mysql.com/products/workbench/) → interfaz gráfica para ver tablas, ejecutar consultas (queries) y modelar.

> Alternativa GUI: **DBeaver** (si quieres una sola herramienta para distintos motores de BD).

---

## Pasos típicos (MySQL Installer for Windows)

### 1) Instalar
1. Descarga e instala **MySQL Installer for Windows** (incluye **Server + Workbench**).

### 2) Configurar durante la instalación
- Define una **contraseña para `root`**.
- Deja el **puerto 3306** (por defecto).
- Activa que corra como **Windows Service** (inicio automático).

### 3) Verificar que está corriendo
- Abre **Services / Servicios**.
- Busca **MySQL80** (o similar) y revisa que esté en **Running**.

### 4) Probar desde consola (si agregaste MySQL al `PATH`)
```bash
mysql --version
mysql -u root -p


GUI recomendada: MySQL Workbench (o DBeaver si quieres uno para todo).