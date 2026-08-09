#!/bin/bash
# =================================================================
# megaos-samsung-cleaner.sh - MegaOS Project (Samsung Edition)
# Extreme telemetry and bloatware removal script for Samsung One UI
# Compatible with generic Samsung Android devices
# =================================================================

echo "Starting megaos-samsung-cleaner.sh..."
echo "Ensure your Samsung device is connected with USB Debugging enabled."

# Check if ADB detects the device
adb devices | grep -q "device$"
if [ $? -ne 0 ]; then
    echo "Error: Device not detected. Please check your USB connection."
    exit 1
fi

echo "Removing Samsung core bloatware and assistants..."
samsung_apps=(
    "com.samsung.android.bixby.agent"          # Bixby Agent
    "com.samsung.android.bixby.wakeup"         # Bixby Voice Wakeup
    "com.samsung.android.bixbyvision.framework" # Bixby Vision
    "com.samsung.android.app.spage"            # Samsung Daily / Discovery
    "com.sec.android.app.sbrowser"             # Samsung Internet Browser
    "com.samsung.android.messaging"            # Samsung Messages
    "com.samsung.android.kidshome"             # Samsung Kids Mode
    "com.samsung.android.app.watchmanagerstub" # Galaxy Wearable Installer
    "com.sec.android.app.billing"              # Samsung Billing
    "com.samsung.android.scloud"               # Samsung Cloud sync
    "com.samsung.android.app.tips"             # Samsung Tips
)

for app in "${samsung_apps[@]}"; do
    echo "Removing: $app"
    adb shell pm uninstall --user 0 $app > /dev/null 2>&1
done

echo "Removing Google companion apps and tracking services..."
google_apps=(
    "com.google.android.apps.tachyon"          # Google Meet
    "com.google.android.projection.gearhead"     # Android Auto
    "com.google.android.apps.wellbeing"        # Digital Wellbeing
    "com.google.android.youtube"               # Stock YouTube
    "com.google.android.apps.photos"           # Google Photos
    "com.google.android.apps.maps"             # Google Maps
    "com.google.android.calendar"              # Google Calendar
    "com.google.android.apps.docs"             # Google Drive
    "com.google.android.gm"                    # Gmail
    "com.google.android.googlequicksearchbox"  # Google Search App
    "com.google.android.videos"                # Google TV
    "com.google.android.music"                 # YouTube Music
)

for app in "${google_apps[@]}"; do
    echo "Removing: $app"
    adb shell pm uninstall --user 0 $app > /dev/null 2>&1
done

echo "Samsung clean completed successfully! MegaOS is deployed."

