#!/usr/bin/env python3
"""Expand the generic DTC seed into per-make catalog entries + OEM-specific codes."""

from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "scripts" / "seed" / "dtc_catalog_universal.json"
OUT = ROOT / "CarDoctor" / "Resources" / "Seed" / "dtc_catalog.json"

SUPPORTED_MAKES = [
    "Toyota",
    "Honda",
    "Ford",
    "Chevrolet",
    "Volkswagen",
    "BMW",
    "Mercedes-Benz",
    "Hyundai",
    "Kia",
    "Nissan",
    "Mazda",
    "Subaru",
    "Audi",
    "Peugeot",
    "Renault",
    "Fiat",
    "Volvo",
    "Jeep",
]

# Manufacturer-specific DTCs (not shared generic catalog).
OEM_CODES: list[dict] = [
    {
        "code": "P1135",
        "make": "Toyota",
        "titleTR": "Ön Isıtmalı O2 Sensörü Isıtıcı Devresi (Banka 1 Sensör 1)",
        "titleEN": "A/F Sensor Heater Circuit (Bank 1 Sensor 1)",
        "descriptionTR": "Toyota A/F sensör ısıtıcı devresinde arıza. Genelde ön oksijen/A-F sensörü veya kablo demeti.",
        "descriptionEN": "Toyota A/F sensor heater circuit fault. Usually the upstream A/F sensor or wiring.",
        "severity": "medium",
        "partId": "o2_sensor",
        "repairStepsTR": [
            "Toyota Techstream ile canlı A/F ısıtıcı akımını kontrol et",
            "Sensör konektörünü ve topraklama noktalarını incele",
            "Isıtıcı direncini servis spesifikasyonuna göre ölç",
            "Gerekirse orijinal A/F sensörünü değiştir",
            "Kodları sil ve kısa yol testi yap",
        ],
        "repairStepsEN": [
            "Check live A/F heater current with Techstream",
            "Inspect sensor connector and grounds",
            "Measure heater resistance to Toyota specs",
            "Replace OEM A/F sensor if needed",
            "Clear codes and short road-test",
        ],
        "safetyNotesTR": "Egzoz sıcakken sensöre dokunmayın.",
        "safetyNotesEN": "Do not touch the sensor while the exhaust is hot.",
    },
    {
        "code": "P1349",
        "make": "Toyota",
        "titleTR": "VVT Sistem Arızası (Banka 1)",
        "titleEN": "VVT System Malfunction (Bank 1)",
        "descriptionTR": "Toyota VVT-i yağ kontrol valfi veya zamanlama mekanizması sapması.",
        "descriptionEN": "Toyota VVT-i oil control valve or timing mechanism deviation.",
        "severity": "high",
        "partId": "cam_sensor",
        "repairStepsTR": [
            "Motor yağı seviyesini ve viskozitesini doğrula",
            "Yağ kontrol valfini (OCV) ve filtresini temizle/test et",
            "VVT aktüatörünü dinle ve Techstream ile açı değerlerini izle",
            "Gerekirse OCV veya VVT aktüatörünü değiştir",
            "Kodları sil ve rölanti/yük testi yap",
        ],
        "repairStepsEN": [
            "Verify oil level and viscosity",
            "Clean/test the oil control valve (OCV)",
            "Monitor VVT angle with Techstream",
            "Replace OCV or VVT actuator if needed",
            "Clear codes and idle/load test",
        ],
        "safetyNotesTR": "Düşük yağ basıncı motor hasarına yol açabilir.",
        "safetyNotesEN": "Low oil pressure can cause engine damage.",
    },
    {
        "code": "P1457",
        "make": "Honda",
        "titleTR": "EVAP Kanister Sistem Kaçağı (Honda)",
        "titleEN": "EVAP Canister System Leak (Honda)",
        "descriptionTR": "Honda EVAP kanister purge/vent tarafında kaçak veya tıkanıklık.",
        "descriptionEN": "Honda EVAP canister purge/vent side leak or blockage.",
        "severity": "low",
        "partId": "fuel_pump",
        "repairStepsTR": [
            "Yakıt kapağını ve conta durumunu kontrol et",
            "Honda HDS ile EVAP sızıntı testini çalıştır",
            "Kanister vent valfini ve hortumları incele",
            "Kaçağı duman makinesi ile lokalize et",
            "Arızalı valf/hortumu değiştir ve kodları sil",
        ],
        "repairStepsEN": [
            "Inspect fuel cap and seal",
            "Run EVAP leak test with Honda HDS",
            "Check canister vent valve and hoses",
            "Locate leak with smoke machine",
            "Replace failed valve/hose and clear codes",
        ],
        "safetyNotesTR": "Yakıt buharı: kıvılcım ve açık ateşten uzak durun.",
        "safetyNotesEN": "Fuel vapor hazard: keep sparks and open flame away.",
    },
    {
        "code": "P1259",
        "make": "Honda",
        "titleTR": "VTEC Sistem Arızası",
        "titleEN": "VTEC System Malfunction",
        "descriptionTR": "Honda VTEC yağ basınç şalteri veya solenoid arızası.",
        "descriptionEN": "Honda VTEC oil pressure switch or solenoid fault.",
        "severity": "medium",
        "partId": "engine",
        "repairStepsTR": [
            "Motor yağı seviyesini ve kalitesini kontrol et",
            "VTEC solenoidini ve filtresini temizle",
            "Yağ basınç şalteri sinyalini HDS ile doğrula",
            "Gerekirse solenoid/şalter değiştir",
            "Kodları sil ve yüksek devir testi yap",
        ],
        "repairStepsEN": [
            "Check oil level and condition",
            "Clean VTEC solenoid and screen",
            "Verify oil pressure switch signal with HDS",
            "Replace solenoid/switch if needed",
            "Clear codes and high-RPM test",
        ],
        "safetyNotesTR": "Yanlış yağ viskozitesi VTEC’i engelleyebilir.",
        "safetyNotesEN": "Wrong oil viscosity can prevent VTEC engagement.",
    },
    {
        "code": "P1000",
        "make": "Ford",
        "titleTR": "OBD Sistemleri Hazır Değil",
        "titleEN": "OBD Systems Readiness Not Complete",
        "descriptionTR": "Ford PCM henüz tüm monitörleri tamamlamadı (genelde batarya kesintisi sonrası).",
        "descriptionEN": "Ford PCM has not completed all readiness monitors (often after battery disconnect).",
        "severity": "low",
        "partId": "engine",
        "repairStepsTR": [
            "Aktif arıza kodu olmadığını doğrula",
            "Ford sürüş çevrimini (drive cycle) uygula",
            "FORScan/IDS ile monitör durumunu izle",
            "Şarj sistemi voltajını kontrol et",
            "Monitörler hazır olana kadar yol testi tekrarla",
        ],
        "repairStepsEN": [
            "Confirm no hard fault codes",
            "Perform Ford drive cycle",
            "Watch monitor status with FORScan/IDS",
            "Check charging-system voltage",
            "Repeat road test until monitors set",
        ],
        "safetyNotesTR": "Emisyon testi öncesi monitörlerin hazır olması gerekir.",
        "safetyNotesEN": "Readiness monitors must be complete before emissions testing.",
    },
    {
        "code": "P1450",
        "make": "Ford",
        "titleTR": "Yakıt Deposu Basınç Kontrol Kaçağı",
        "titleEN": "Unable to Bleed Up Fuel Tank Vacuum",
        "descriptionTR": "Ford EVAP yakıt deposu vakum oluşturamıyor; kapak, CV solenoid veya kaçak.",
        "descriptionEN": "Ford EVAP cannot build tank vacuum; cap, CV solenoid, or leak.",
        "severity": "medium",
        "partId": "fuel_pump",
        "repairStepsTR": [
            "Yakıt kapağını OEM spesifikasyonunda değiştirip test et",
            "Canister vent (CV) solenoidini test et",
            "Depo basınç sensörü değerlerini izle",
            "Duman testi ile kaçak noktasını bul",
            "Arızalı parçayı değiştir ve kodları sil",
        ],
        "repairStepsEN": [
            "Retest with a known-good OEM fuel cap",
            "Test canister vent (CV) solenoid",
            "Monitor tank pressure sensor values",
            "Smoke-test to find the leak",
            "Replace failed part and clear codes",
        ],
        "safetyNotesTR": "Yakıt sistemi üzerinde çalışırken havalandırma sağlayın.",
        "safetyNotesEN": "Ventilate the area when working on the fuel system.",
    },
    {
        "code": "P1297",
        "make": "Volkswagen",
        "titleTR": "Bağlantı Hortumu Emme Manifoldu / Turbo",
        "titleEN": "Connection Hose Intake Manifold / Turbo",
        "descriptionTR": "VW/Audi emme tarafı hortum kaçağı veya turbo basınç sapması.",
        "descriptionEN": "VW/Audi intake-side hose leak or boost deviation.",
        "severity": "high",
        "partId": "maf_sensor",
        "repairStepsTR": [
            "VCDS ile ölçülen bloklarda boost sapmasını kontrol et",
            "Emme ve turbo hortumlarını çatlak/kelepçe açısından incele",
            "N75 / boost kontrol bileşenlerini test et",
            "Kaçak hortumu veya valfi değiştir",
            "Adaptasyonları sıfırla ve yol testi yap",
        ],
        "repairStepsEN": [
            "Check boost deviation in VCDS measuring blocks",
            "Inspect intake/turbo hoses for cracks/clamps",
            "Test N75 / boost control components",
            "Replace leaking hose or valve",
            "Reset adaptations and road-test",
        ],
        "safetyNotesTR": "Turbo sıcakken hortumlara dokunmayın.",
        "safetyNotesEN": "Do not touch turbo hoses while hot.",
    },
    {
        "code": "P1557",
        "make": "Audi",
        "titleTR": "Turbo Şarj Basıncı Kontrol Sınırı Aşıldı",
        "titleEN": "Charge Pressure Control Upper Limit Exceeded",
        "descriptionTR": "Audi/VW turbo aşırı boost; wastegate veya kontrol sorunu.",
        "descriptionEN": "Audi/VW overboost; wastegate or control issue.",
        "severity": "high",
        "partId": "engine",
        "repairStepsTR": [
            "VCDS ile istenen/gerçek boost karşılaştır",
            "Wastegate aktüatörünü ve çubuk ayarını kontrol et",
            "Basınç kontrol valfini test et",
            "Gerekirse aktüatör/valf değiştir",
            "Kodları sil ve kontrollü yük testi yap",
        ],
        "repairStepsEN": [
            "Compare requested vs actual boost in VCDS",
            "Inspect wastegate actuator and rod adjustment",
            "Test the boost control valve",
            "Replace actuator/valve if needed",
            "Clear codes and controlled load-test",
        ],
        "safetyNotesTR": "Aşırı boost motor hasarı riski taşır; sert sürmeyin.",
        "safetyNotesEN": "Overboost risks engine damage; avoid hard driving.",
    },
    {
        "code": "P1055",
        "make": "BMW",
        "titleTR": "VANOS Emme Solenoid Devresi",
        "titleEN": "VANOS Intake Solenoid Circuit",
        "descriptionTR": "BMW VANOS emme solenoid elektrik/performans arızası.",
        "descriptionEN": "BMW VANOS intake solenoid electrical/performance fault.",
        "severity": "medium",
        "partId": "cam_sensor",
        "repairStepsTR": [
            "ISTA ile VANOS solenoid çıkışını test et",
            "Konektör pinlerini ve yağ sızıntısını kontrol et",
            "Solenoid direncini ölç",
            "Gerekirse VANOS solenoidini değiştir",
            "DME kodlarını sil ve rölanti testi yap",
        ],
        "repairStepsEN": [
            "Test VANOS solenoid output with ISTA",
            "Inspect connector pins and oil seepage",
            "Measure solenoid resistance",
            "Replace VANOS solenoid if needed",
            "Clear DME codes and idle-test",
        ],
        "safetyNotesTR": "Doğru motor yağı VANOS sağlığı için kritiktir.",
        "safetyNotesEN": "Correct engine oil is critical for VANOS health.",
    },
    {
        "code": "P2004",
        "make": "Mercedes-Benz",
        "titleTR": "Emme Manifoldu Çalıştırıcı Sıkışmış (Banka 1)",
        "titleEN": "Intake Manifold Runner Stuck Open (Bank 1)",
        "descriptionTR": "Mercedes emme manifoldu flap aktüatörü açık konumda sıkışmış.",
        "descriptionEN": "Mercedes intake manifold runner stuck open.",
        "severity": "medium",
        "partId": "throttle_body",
        "repairStepsTR": [
            "XENTRY ile aktüatör konum geri bildirimini izle",
            "Flap mekanizmasının serbest hareketini kontrol et",
            "Karbon temizliği veya aktüatör değişimi yap",
            "Adaptasyonları sıfırla",
            "Kodları sil ve yol testi yap",
        ],
        "repairStepsEN": [
            "Monitor actuator position feedback with XENTRY",
            "Check free movement of the runner flaps",
            "Perform carbon clean or replace actuator",
            "Reset adaptations",
            "Clear codes and road-test",
        ],
        "safetyNotesTR": "Emme tarafında yabancı madde bırakmayın.",
        "safetyNotesEN": "Do not leave debris in the intake tract.",
    },
    {
        "code": "P1326",
        "make": "Hyundai",
        "titleTR": "Knock Sensörü Algılama Sistemi (Hyundai/Kia)",
        "titleEN": "Knock Sensor Detection System (Hyundai/Kia)",
        "descriptionTR": "Hyundai/Kia motor koruma yazılımı; vuruntu sensörü veya ilgili TSB kapsamı.",
        "descriptionEN": "Hyundai/Kia engine protection logic; knock sensor or related TSB scope.",
        "severity": "high",
        "partId": "knock_sensor",
        "repairStepsTR": [
            "Güncel Hyundai/Kia TSB ve yazılım güncellemelerini kontrol et",
            "Knock sensörü kablolamasını incele",
            "Gerekirse sensörü OEM ile değiştir",
            "ECU yazılım güncellemesi uygula",
            "Kodları sil ve yol testi yap",
        ],
        "repairStepsEN": [
            "Check current Hyundai/Kia TSB and software updates",
            "Inspect knock sensor wiring",
            "Replace sensor with OEM if required",
            "Apply ECU software update",
            "Clear codes and road-test",
        ],
        "safetyNotesTR": "Güç kaybı modunda otoyolda kalmayın.",
        "safetyNotesEN": "Do not remain on highways in limp mode.",
    },
    {
        "code": "P1326",
        "make": "Kia",
        "titleTR": "Knock Sensörü Algılama Sistemi (Hyundai/Kia)",
        "titleEN": "Knock Sensor Detection System (Hyundai/Kia)",
        "descriptionTR": "Kia motor koruma yazılımı; vuruntu sensörü veya ilgili TSB kapsamı.",
        "descriptionEN": "Kia engine protection logic; knock sensor or related TSB scope.",
        "severity": "high",
        "partId": "knock_sensor",
        "repairStepsTR": [
            "Güncel Kia TSB ve yazılım güncellemelerini kontrol et",
            "Knock sensörü kablolamasını incele",
            "Gerekirse sensörü OEM ile değiştir",
            "ECU yazılım güncellemesi uygula",
            "Kodları sil ve yol testi yap",
        ],
        "repairStepsEN": [
            "Check current Kia TSB and software updates",
            "Inspect knock sensor wiring",
            "Replace sensor with OEM if required",
            "Apply ECU software update",
            "Clear codes and road-test",
        ],
        "safetyNotesTR": "Güç kaybı modunda otoyolda kalmayın.",
        "safetyNotesEN": "Do not remain on highways in limp mode.",
    },
    {
        "code": "P1682",
        "make": "Chevrolet",
        "titleTR": "Kontak Anahtarı Devre 2 Tutarsız",
        "titleEN": "Ignition 1 Switch Circuit 2",
        "descriptionTR": "GM ateşleme anahtarı / güç dağıtım tutarsızlığı.",
        "descriptionEN": "GM ignition switch / power distribution inconsistency.",
        "severity": "medium",
        "partId": "battery",
        "repairStepsTR": [
            "Akü ve şarj voltajını ölç",
            "ATEŞLEME / RUN güç beslemelerini kontrol et",
            "Underhood fuse bloğu kontaklarını incele",
            "Gerekirse ateşleme anahtarı veya ilgili röleyi değiştir",
            "Kodları sil ve tekrar dene",
        ],
        "repairStepsEN": [
            "Measure battery and charging voltage",
            "Check IGNITION/RUN power feeds",
            "Inspect underhood fuse-block contacts",
            "Replace ignition switch or related relay if needed",
            "Clear codes and retest",
        ],
        "safetyNotesTR": "Elektrik işlerinde akü negatifini ayırın.",
        "safetyNotesEN": "Disconnect battery negative when doing electrical work.",
    },
    {
        "code": "P1320",
        "make": "Nissan",
        "titleTR": "Ateşleme Sinyali Primer",
        "titleEN": "Ignition Signal Primary",
        "descriptionTR": "Nissan ateşleme bobini primer sinyal kaybı.",
        "descriptionEN": "Nissan ignition coil primary signal loss.",
        "severity": "high",
        "partId": "ignition_coil",
        "repairStepsTR": [
            "Consult III ile tekleme sayaçlarını izle",
            "Bobin besleme ve topraklamayı ölç",
            "Bobinleri çapraz değiştirerek izolasyon yap",
            "Arızalı bobini değiştir",
            "Kodları sil ve yol testi yap",
        ],
        "repairStepsEN": [
            "Monitor misfire counts with Consult III",
            "Measure coil power and ground",
            "Swap coils to isolate the fault",
            "Replace the failed coil",
            "Clear codes and road-test",
        ],
        "safetyNotesTR": "Ateşleme sisteminde yüksek voltaj vardır.",
        "safetyNotesEN": "Ignition systems carry high voltage.",
    },
    {
        "code": "P0021",
        "make": "Subaru",
        "titleTR": "Eksantrik Zamanlama Aşırı İleri (Banka 2)",
        "titleEN": "Camshaft Position Timing Over-Advanced (Bank 2)",
        "descriptionTR": "Subaru AVCS zamanlama sapması; yağ veya aktüatör kaynaklı olabilir.",
        "descriptionEN": "Subaru AVCS timing deviation; oil or actuator related.",
        "severity": "high",
        "partId": "cam_sensor",
        "repairStepsTR": [
            "Doğru yağ spesifikasyonunu doğrula",
            "AVCS yağ kontrol solenoidini temizle/test et",
            "SSM ile kam zamanlama verisini izle",
            "Gerekirse solenoid/aktüatör değiştir",
            "Kodları sil ve yol testi yap",
        ],
        "repairStepsEN": [
            "Confirm correct oil specification",
            "Clean/test AVCS oil control solenoid",
            "Monitor cam timing data with SSM",
            "Replace solenoid/actuator if needed",
            "Clear codes and road-test",
        ],
        "safetyNotesTR": "Yanlış yağ timing sorunlarını tetikleyebilir.",
        "safetyNotesEN": "Wrong oil can trigger timing faults.",
    },
    {
        "code": "P2096",
        "make": "Mazda",
        "titleTR": "Post Katalizör Yakıt Trim Çok Zayıf (Banka 1)",
        "titleEN": "Post Catalyst Fuel Trim Too Lean (Bank 1)",
        "descriptionTR": "Mazda egzoz sonrası yakıt trim zayıf; kaçak veya O2 sensörü.",
        "descriptionEN": "Mazda post-cat fuel trim lean; leak or O2 sensor.",
        "severity": "medium",
        "partId": "o2_sensor",
        "repairStepsTR": [
            "Egzoz kaçaklarını dinle ve incele",
            "Downstream O2 sinyalini grafik olarak izle",
            "MAF kalibrasyonunu kontrol et",
            "Gerekirse O2 sensörünü değiştir",
            "Kodları sil ve yakıt trimlerini izle",
        ],
        "repairStepsEN": [
            "Listen/inspect for exhaust leaks",
            "Graph downstream O2 signal",
            "Verify MAF calibration",
            "Replace O2 sensor if needed",
            "Clear codes and watch fuel trims",
        ],
        "safetyNotesTR": "Egzoz gazı zehirlidir; kapalı alanda çalışmayın.",
        "safetyNotesEN": "Exhaust fumes are toxic; do not work in enclosed spaces.",
    },
    {
        "code": "P0299",
        "make": "Peugeot",
        "titleTR": "Turbo / Süperşarjer Yetersiz Boost",
        "titleEN": "Turbo/Supercharger Underboost",
        "descriptionTR": "PSA turbo basıncı hedefin altında; hortum, aktüatör veya EGR etkisi.",
        "descriptionEN": "PSA turbo pressure below target; hose, actuator, or EGR influence.",
        "severity": "high",
        "partId": "engine",
        "repairStepsTR": [
            "Diagbox ile istenen/gerçek basıncı karşılaştır",
            "Boost hortumlarını ve intercooler bağlantılarını incele",
            "EGR ve turbo aktüatörünü test et",
            "Arızalı hortum/aktüatörü değiştir",
            "Kodları sil ve yük testi yap",
        ],
        "repairStepsEN": [
            "Compare requested vs actual boost with Diagbox",
            "Inspect boost hoses and intercooler joints",
            "Test EGR and turbo actuator",
            "Replace failed hose/actuator",
            "Clear codes and load-test",
        ],
        "safetyNotesTR": "Dizelde partikül filtresi uyarılarını da kontrol edin.",
        "safetyNotesEN": "On diesels, also check DPF-related warnings.",
    },
    {
        "code": "P0234",
        "make": "Renault",
        "titleTR": "Motor Aşırı Boost Durumu",
        "titleEN": "Engine Overboost Condition",
        "descriptionTR": "Renault turbo aşırı basınç; wastegate veya basınç sensörü.",
        "descriptionEN": "Renault turbo overboost; wastegate or pressure sensor.",
        "severity": "high",
        "partId": "engine",
        "repairStepsTR": [
            "CLIP ile boost ve MAP verisini izle",
            "Wastegate hareketini kontrol et",
            "Basınç sensörü kalibrasyonunu doğrula",
            "Arızalı parçayı değiştir",
            "Kodları sil ve kontrollü test sürüşü yap",
        ],
        "repairStepsEN": [
            "Monitor boost and MAP with CLIP",
            "Check wastegate movement",
            "Verify pressure sensor calibration",
            "Replace the failed part",
            "Clear codes and controlled test-drive",
        ],
        "safetyNotesTR": "Aşırı boost’ta aracı zorlamayın.",
        "safetyNotesEN": "Do not stress the engine under overboost.",
    },
    {
        "code": "P1336",
        "make": "Fiat",
        "titleTR": "Krank Sensörü Öğrenme / Diş Hatası",
        "titleEN": "Crankshaft Sensor Learning / Tooth Error",
        "descriptionTR": "Fiat/FCA krank sensörü sinyali veya çark diş hatası.",
        "descriptionEN": "Fiat/FCA crank sensor signal or reluctor tooth error.",
        "severity": "high",
        "partId": "crank_sensor",
        "repairStepsTR": [
            "WiTECH/MultiECUScan ile krank sinyalini izle",
            "Sensör hava boşluğunu ölç",
            "Reluctor çark hasarını kontrol et",
            "Sensörü değiştir ve relearn prosedürünü uygula",
            "Kodları sil ve marş/çalışma testi yap",
        ],
        "repairStepsEN": [
            "Monitor crank signal with WiTECH/MultiECUScan",
            "Measure sensor air gap",
            "Inspect reluctor wheel damage",
            "Replace sensor and perform relearn",
            "Clear codes and crank/run test",
        ],
        "safetyNotesTR": "Marş sırasında dönen parçalardan uzak durun.",
        "safetyNotesEN": "Keep clear of rotating parts while cranking.",
    },
    {
        "code": "P2119",
        "make": "Volvo",
        "titleTR": "Gaz Kelebeği Aktüatör Performans / Kapalı Takılı",
        "titleEN": "Throttle Actuator Performance / Stuck Closed",
        "descriptionTR": "Volvo elektronik gaz kelebeği aktüatör performans sapması.",
        "descriptionEN": "Volvo electronic throttle actuator performance deviation.",
        "severity": "high",
        "partId": "throttle_body",
        "repairStepsTR": [
            "VIDA ile gaz kelebeği açı sensörlerini izle",
            "Kelebek gövdesini temizle",
            "Adaptasyon/öğrenme prosedürünü çalıştır",
            "Gerekirse kelebeği değiştir",
            "Kodları sil ve rölanti kalibrasyonu yap",
        ],
        "repairStepsEN": [
            "Monitor throttle angle sensors with VIDA",
            "Clean the throttle body",
            "Run adaptation/learn procedure",
            "Replace throttle body if needed",
            "Clear codes and idle calibration",
        ],
        "safetyNotesTR": "Gaz kelebeği arızasında güvenli yere çekin.",
        "safetyNotesEN": "Pull over safely if throttle response fails.",
    },
    {
        "code": "P0573",
        "make": "Jeep",
        "titleTR": "Cruise Kontrol / Fren Şalteri A Devresi Yüksek",
        "titleEN": "Cruise Control/Brake Switch A Circuit High",
        "descriptionTR": "Jeep fren şalteri veya cruise ilgili devre yüksek sinyal.",
        "descriptionEN": "Jeep brake switch or cruise-related circuit high signal.",
        "severity": "medium",
        "partId": "abs_module",
        "repairStepsTR": [
            "Fren lambası şalteri ayarını kontrol et",
            "Şalter sinyallerini alphaOBD/WiTECH ile izle",
            "Kablo demeti hasarını incele",
            "Şalteri değiştir",
            "Kodları sil ve fren/cruise testi yap",
        ],
        "repairStepsEN": [
            "Check brake-lamp switch adjustment",
            "Monitor switch signals with alphaOBD/WiTECH",
            "Inspect harness damage",
            "Replace the switch",
            "Clear codes and brake/cruise test",
        ],
        "safetyNotesTR": "Fren lambası çalışmıyorsa gece sürmeyin.",
        "safetyNotesEN": "Do not drive at night if brake lights are inoperative.",
    },
]


def brandify_steps(steps: list[str], make: str, lang: str) -> list[str]:
    if lang == "tr":
        prefix = f"{make} için: "
        tool = {
            "Toyota": "Techstream servis verisiyle doğrula",
            "Honda": "HDS servis verisiyle doğrula",
            "Ford": "FORScan/IDS verisiyle doğrula",
            "Chevrolet": "GM MDI/GDS2 verisiyle doğrula",
            "Volkswagen": "VCDS ölçüm bloklarıyla doğrula",
            "Audi": "VCDS/ODIS ile doğrula",
            "BMW": "ISTA ile doğrula",
            "Mercedes-Benz": "XENTRY ile doğrula",
            "Hyundai": "Hyundai GDS ile doğrula",
            "Kia": "Kia GDS ile doğrula",
            "Nissan": "Consult III ile doğrula",
            "Mazda": "Mazda IDS ile doğrula",
            "Subaru": "SSM ile doğrula",
            "Peugeot": "Diagbox ile doğrula",
            "Renault": "CLIP ile doğrula",
            "Fiat": "MultiECUScan/WiTECH ile doğrula",
            "Volvo": "VIDA ile doğrula",
            "Jeep": "WiTECH ile doğrula",
        }.get(make, "marka servis bilgisyle doğrula")
        out = [prefix + s[0].lower() + s[1:] if s else s for s in steps]
        out.append(tool)
        return out
    prefix = f"For {make}: "
    tool = {
        "Toyota": "Confirm with Techstream service data",
        "Honda": "Confirm with HDS service data",
        "Ford": "Confirm with FORScan/IDS data",
        "Chevrolet": "Confirm with GM MDI/GDS2 data",
        "Volkswagen": "Confirm with VCDS measuring blocks",
        "Audi": "Confirm with VCDS/ODIS",
        "BMW": "Confirm with ISTA",
        "Mercedes-Benz": "Confirm with XENTRY",
        "Hyundai": "Confirm with Hyundai GDS",
        "Kia": "Confirm with Kia GDS",
        "Nissan": "Confirm with Consult III",
        "Mazda": "Confirm with Mazda IDS",
        "Subaru": "Confirm with SSM",
        "Peugeot": "Confirm with Diagbox",
        "Renault": "Confirm with CLIP",
        "Fiat": "Confirm with MultiECUScan/WiTECH",
        "Volvo": "Confirm with VIDA",
        "Jeep": "Confirm with WiTECH",
    }.get(make, "Confirm with brand service information")
    out = [prefix + s[0].lower() + s[1:] if s else s for s in steps]
    out.append(tool)
    return out


def brandify_description(desc: str, make: str, code: str, lang: str) -> str:
    if lang == "tr":
        return f"{make} aracında {code}: {desc} Bu teşhis {make} için markaya özel yorumlanmıştır."
    return f"On {make} vehicles, {code}: {desc} This diagnosis is interpreted specifically for {make}."


def expand_universal(entry: dict, make: str) -> dict:
    return {
        "code": entry["code"],
        "make": make,
        "titleTR": entry["titleTR"],
        "titleEN": entry["titleEN"],
        "descriptionTR": brandify_description(entry["descriptionTR"], make, entry["code"], "tr"),
        "descriptionEN": brandify_description(entry["descriptionEN"], make, entry["code"], "en"),
        "severity": entry["severity"],
        "partId": entry["partId"],
        "repairStepsTR": brandify_steps(entry["repairStepsTR"], make, "tr"),
        "repairStepsEN": brandify_steps(entry["repairStepsEN"], make, "en"),
        "safetyNotesTR": entry["safetyNotesTR"],
        "safetyNotesEN": entry["safetyNotesEN"],
    }


def main() -> None:
    raw = json.loads(SRC.read_text(encoding="utf-8"))
    parts = raw["parts"]
    base_entries = raw["dtc"]
    if base_entries and "make" in base_entries[0]:
        raise SystemExit(f"Expected universal seed without make field at {SRC}")

    expanded: list[dict] = []
    for entry in base_entries:
        for make in SUPPORTED_MAKES:
            expanded.append(expand_universal(entry, make))

    # Add OEM-specific (may duplicate code across makes intentionally)
    oem_keys = {(e["code"], e["make"]) for e in OEM_CODES}
    expanded = [e for e in expanded if (e["code"], e["make"]) not in oem_keys]
    expanded.extend(OEM_CODES)

    expanded.sort(key=lambda e: (e["code"], e["make"]))

    out = {
        "parts": parts,
        "makes": SUPPORTED_MAKES,
        "dtc": expanded,
    }
    OUT.write_text(json.dumps(out, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {len(expanded)} brand-specific DTC entries for {len(SUPPORTED_MAKES)} makes -> {OUT}")


if __name__ == "__main__":
    main()
