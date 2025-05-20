plugins {
    id("com.android.application")
    id("kotlin-android")

    
    id("com.google.gms.google-services")

    // Flutter plugin must come last
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.hiru_super"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.hiru_super"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
  
    implementation(platform("com.google.firebase:firebase-bom:32.3.1"))

    
    implementation("com.google.firebase:firebase-analytics") // Ex: analytics
    // implementation("com.google.firebase:firebase-auth") // If using auth
    // implementation("com.google.firebase:firebase-firestore") // If using Firestore
}
