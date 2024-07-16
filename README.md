
# Getting Started

1. After completing the cloning process, navigate to the "NameProject" directory.
2. Create the .env and .dev.env files.
3. In each file, add the following configuration:

```bash
APP_NAME = ''
APP_VERSION = ''
BASE_URL = ''
```

4. You can run the application using the flutter run command followed by the appropriate arguments based on your desired configuration :

```bash
flutter run lib/main_development.dart --flavor dev     
```

5. Alternatively, you can create a launch.json file inside the .vscode folder with the following configurations:
   
```bash
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "featureName",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_development.dart",
            "args": [
                "--flavor",
                "dev"
            ]
        },
        {
            "name": "featureName - Release",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_development.dart",
            "args": [
                "--flavor",
                "dev",
                "--release"
            ]
        },
        {
            "name": "featureName STG",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_staging.dart",
            "args": [
                "--flavor",
                "stg"
            ]
        }
    ]
}

```

