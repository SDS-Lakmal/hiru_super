import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

// ✅ Repositories for all projects
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ Set custom build directories
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// ✅ Make sure the app module is evaluated before others
subprojects {
    project.evaluationDependsOn(":app")
}

// ✅ Proper Kotlin DSL for buildscript dependencies
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.3.0")
        classpath("com.google.gms:google-services:4.4.1")
    }
}

// ✅ Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
