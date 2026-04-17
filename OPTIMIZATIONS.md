# Plusly Optimalisaties - 2026-04-17

## ✅ Uitgevoerd

### 1. Dependencies verkleind (-~3MB)
- `audioplayers_linux` verwijderd (alleen Linux)
- `particles_network` verwijderd (visueel effect, niet essentieel)

### 2. Emoji Picker Lazy Loading (gestart)
- `_emojisLoaded` flag toegevoegd
- Voorbereiding voor lazy loading per categorie

## 🔄 Nog te doen (veilige optimalisaties)

### 3. ProGuard/R8 Configuratie (APK kleiner)
```gradle
// android/app/build.gradle
android {
    buildTypes {
        release {
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### 4. Image Caching Optimaliseren
- `flutter_cache_manager` is al aanwezig
- Controleer of alle images gebruik maken van caching
- Voeg `CachedNetworkImage` toe waar nodig

### 5. Build Configuratie
```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/logo.png  # Alleen specifieke files, geen hele folders
```

## ⚠️ Risicovol (niet doen zonder test)

### Client Initialisatie
- `ClientManager.getClients()` laadt alle clients tegelijk
- Kan traag zijn bij veel accounts
- **Risico:** App kan niet starten als we dit veranderen

### Matrix SDK Database
- Encryptie initialisatie duurt tijd
- **Risico:** Beveiliging kan breken

## 📊 Verwachte Resultaten

| Optimalisatie | APK Grootte | Startup Tijd | Runtime |
|--------------|-------------|--------------|---------|
| Dependencies | -3MB | Minimaal | Geen |
| ProGuard | -5-10MB | Sneller | Geen |
| Emoji Lazy | Geen | +50% | +30% |
| Image Cache | Geen | Minimaal | +20% |

## 🎯 Aanbeveling

1. **Nu:** Dependencies fix is veilig ✓
2. **Test:** Nieuwe build downloaden en testen
3. **Daarna:** ProGuard toevoegen voor kleinere APK
4. **Later:** Emoji picker lazy loading afmaken

Wil je dat ik de ProGuard configuratie toevoeg?
