# CarDoctor

VIN + OBD-II arıza kodu → parça / tamir adımları / 3D highlight / topluluk videoları.

**Şu anki hedef: Google Play (Android) — Windows’ta geliştirme.**

| Klasör | Ne |
|--------|----|
| [`mobile/`](mobile/) | **Aktif** Flutter uygulaması (Android + ileride iOS) |
| [`CarDoctor/`](CarDoctor/) | Eski native SwiftUI prototipi (Mac gelince / iOS native) |
| [`firebase/`](firebase/) | Firestore & Storage kuralları |

## Windows hızlı başlangıç

Flutter SDK kuruldu: `%USERPROFILE%\flutter`

```powershell
# PATH (oturum)
$env:Path = "$env:USERPROFILE\flutter\bin;$env:Path"
$env:JAVA_HOME = "C:\Program Files\Android\Android Studio\jbr"
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\Sdk"

cd mobile
flutter pub get
flutter test
flutter run -d chrome          # hemen dene (web)
flutter run                    # Android emülatör / cihaz
flutter build appbundle        # Play Store AAB
```

Kalıcı PATH için Flutter’ı sistem ortam değişkenlerine ekle:
`C:\Users\<sen>\flutter\bin`

### Android Studio

1. Android Studio aç → SDK Manager → **Android SDK Command-line Tools** kur
2. Device Manager’dan bir emülatör oluştur
3. `flutter doctor` yeşil olana kadar lisansları kabul et:

```powershell
flutter doctor --android-licenses
```

## Demo akış

1. **Demo ile devam et**
2. VIN: `1HGCM82633A004352` · DTC: `P0300`
3. **3D’de gör** → Pro’yu aç (Demo)
4. Topluluk / video yükleme

## Google Play yayın checklist

1. [ ] Play Console hesabı (bir kerelik kayıt ücreti)
2. [ ] `applicationId`: `com.cardoctor.cardoctor` (istersen değiştir)
3. [ ] Release keystore oluştur, `android/key.properties` bağla
4. [ ] `flutter build appbundle`
5. [ ] Store listing: Google Play yüksek hacimli diller (TR, EN, ES, PT-BR, HI, ID, AR, … — uygulama içi 40+ dil), ekran görüntüleri, gizlilik politikası URL
6. [ ] Data safety formu
7. [ ] (Sonra) Play Billing abonelik + Firebase Auth

## Diller (Google Play)

Uygulama UI’si `mobile/lib/l10n/` ARB dosyalarıyla yerelleştirildi (~40 dil: EN, TR, ES, ES-419, PT-BR/PT, HI, ID, AR, RU, DE, FR, JA, KO, ZH, VI, TH, IT, PL, NL, MS, FIL, UR, BN, FA, UK, RO, CS, SV, EL, HE, HU, DA, FI, NB, SK, HR, BG, SW, CA). Profil ekranından dil seçilebilir. DTC katalog metinleri şimdilik TR/EN.

## Features (MVP+)

- ~59 DTC kataloğu (TR/EN + çoklu dil)
- NHTSA VIN decode
- Tamir adımları + güvenlik uyarısı
- **Gerçek GLB 3D** (Khronos CarConcept) + arıza hotspot / kamera focus (Pro)
- Community like/yorum
- Video seç + kota (ücretsiz 1 / Pro 30)
- Demo Pro paywall
- Yenilenmiş UI: Syne + Manrope, workshop atmosferi, motion

## 3D modeller

`mobile/assets/models/car_concept.glb` — Khronos CarConcept (CC-BY 4.0). Attribution: [`assets/models/ATTRIBUTION.md`](mobile/assets/models/ATTRIBUTION.md).

## Sonraki adımlar

1. Android cmdline-tools + emülatör → `flutter run`
2. Play Console + imzalı AAB
3. Firebase Auth / Firestore / Storage
4. `in_app_purchase` (Play Billing)
5. Arkadaşın Mac’iyle aynı Flutter kodundan iOS build
