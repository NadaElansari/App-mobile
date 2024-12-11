# ProGuard rules for Android projects

# Keep the class and members used by the application
-keepclassmembers class * {
    @androidx.annotation.Keep <fields>;
    @androidx.annotation.Keep <methods>;
}

# Keep the class and members used by the support library
-keepclassmembers class **.R$* {
    public static <fields>;
}
-keepclassmembers class **.R {
    public static <fields>;
}
