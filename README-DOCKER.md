# 🐳 Redbubble Merchandise Branding App - Docker Containerization Guide

This project contains complete Docker configuration for containerizing the full application stack:
- **MariaDB Database**: Auto-imports `redbubble.sql` schema and initial data.
- **PHP Apache Backend**: Serves the API endpoints and upload directories (`upload_products`, `upload_designs`, `android_files`).
- **phpMyAdmin**: Web GUI for database management.
- **Android Builder Container**: Build Android APK binaries without needing a local Android SDK setup.

---

## 🛠️ Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running on Windows/macOS/Linux.
- Docker Compose V2 support (`docker compose` command).

---

## 🚀 Quick Start (Running the App)

From the root directory of the workspace, run:

```bash
docker compose up -d
```

This will automatically:
1. Spin up the MariaDB container (`redbubble_db`).
2. Automatically import `DATABASE/redbubble.sql` into the `redbubble` database.
3. Build and launch the PHP Apache API backend (`redbubble_backend`).
4. Launch phpMyAdmin (`redbubble_phpmyadmin`).

---

## 🌐 Service Endpoints

| Service | Container | Host URL | Credentials |
| :--- | :--- | :--- | :--- |
| **PHP API Backend** | `redbubble_backend` | `http://localhost:8082/redbubble/` | N/A |
| **phpMyAdmin Web UI** | `redbubble_phpmyadmin` | `http://localhost:8081` | User: `root` / Pass: `root_password` |
| **MariaDB Database** | `redbubble_db` | `localhost:3306` | DB: `redbubble`, User: `redbubble_user`, Pass: `redbubble_password` |

---

## 📱 Connecting the Android Mobile App

To connect the Android App (`MOBILE APP/Redbubble`) to the dockerized backend:

1. Open `app/src/main/java/com/example/Varsani/utils/Urls.java`.
2. Update the `ipAddress` field depending on your testing setup:

### A. Android Emulator (Android Studio)
```java
public static String ipAddress = "http://10.0.2.2:8080/redbubble/";
```
*(Note: `10.0.2.2` is the special alias to `localhost` from inside the Android Emulator)*.

### B. Physical Android Phone (Same Wi-Fi network)
Find your computer's local IP address (e.g. `192.168.0.102` using `ipconfig` on Windows) and set:
```java
public static String ipAddress = "http://192.168.0.102:8080/redbubble/";
```

---

## 🏗️ Building the Android App via Docker (Optional)

You can build the Android debug APK using Docker without installing Android Studio or Gradle locally:

```bash
docker compose --profile build up android-builder
```

The compiled APK will be generated inside:
`MOBILE APP/Redbubble/app/build/outputs/apk/debug/app-debug.apk`

---

## 🧹 Stopping & Managing Containers

- **Stop containers**:
  ```bash
  docker compose down
  ```

- **Stop containers and wipe database volume (clean reset)**:
  ```bash
  docker compose down -v
  ```

- **View backend logs**:
  ```bash
  docker compose logs -f backend
  ```

- **View database logs**:
  ```bash
  docker compose logs -f db
  ```
