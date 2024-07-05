import 'dart:io';

void createCleanArchitecture(
  String featureName,
) {
  var baseDir = Directory(".");

  // Core folders
  var coreFolders = [
    "core/error",
    "core/usecases",
    "core/utils",
    "core/platform",
    "core/network",
  ];

  // Feature folders
  var featureFolders = [
    "features/$featureName/data/datasources",
    // "features/$featureName/data/models",
    // "features/$featureName/data/repositories",
    // "features/$featureName/domain/entities",
    // "features/$featureName/domain/repositories",
    // "features/$featureName/domain/usecases",
    // "features/$featureName/presentation/bloc",
    // "features/$featureName/presentation/pages",
    // "features/$featureName/presentation/widgets",
  ];

  // Create directories
  for (var folder in coreFolders + featureFolders) {
    var dir = Directory("${baseDir.path}/$folder");
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

// data/datasource/remote/example/example_remote_data_source.dart
  // Create example files with content
  var exampleFiles = {
    "data/datasource/remote/example/${featureName}_remote_data_source.dart":
        // "import 'package:mobile_banking/core/network/call_api_service.dart';\n"
        //     "import 'package:mobile_banking/data/model/${featureName.toLowerCase()}/request/${featureName.toLowerCase()}_request_model.dart';\n"
        //     "import 'package:mobile_banking/data/model/${featureName.toLowerCase()}/response/${featureName.toLowerCase()}_response_model.dart';\n"
        //     "import 'package:mobile_banking/injection/dependency_injection.dart';\n"
        "abstract class ${featureName.capitalize()}RemoteDataSources {\n"
            " const ${featureName.capitalize()}RemoteDataSources();\n"
            "  Future<${featureName.capitalize()}ModelResponse> ${featureName.toLowerCase()}({required ${featureName.capitalize()}ModelRequest request});\n"
            "}\n\n"
            "class ${featureName.capitalize()}RemoteDataSourcesImpl implements ${featureName.capitalize()}RemoteDataSources {\n"
            "  final callService = sl<CallApiService>();\n\n"
            "  @override\n"
            "  Future<${featureName.capitalize()}ModelResponse>${featureName.toLowerCase()}({required ${featureName.capitalize()}ModelRequest request}) async {\n"
            "   try{\n"
            "     /**\n"
            "     * example code for get data from api service\n"
            "     */\n"
            "     //var dataRequest = request.toJson();\n"
            "     // final response = await callService.connect(\n"
            "     // AppConstants.appAPI.authenticationSignIn\n"
            "     // dataRequest\n"
            "     // HttpMethodConstant.post\n"
            "     //);\n"
            "     //return LoginResponse.fromJson(response.data);\n"
            "     return ExampleModelResponse();\n"
            "    } catch (e) {\n"
            "      rethrow;\n"
            "   }\n"
            "  }\n"
            "}",

    // // Domain files
    // "features/$featureName/domain/entities/${featureName}_entity.dart":
    //     "class ${featureName.capitalize()}Entity {\n  final String id;\n  final String name;\n\n  ${featureName.capitalize()}Entity({required this.id, required this.name});\n}",
    // "features/$featureName/domain/repositories/${featureName}_repository.dart":
    //     "import 'package:dartz/dartz.dart';\n"
    //         "import '../../../../core/error/failures.dart';\n"
    //         "import '../entities/${featureName}_entity.dart';\n\n"
    //         "abstract class ${featureName.capitalize()}Repository {\n"
    //         "  Future<Either<Failure, ${featureName.capitalize()}Entity>> get${featureName.capitalize()}(String id);\n}",
    // "features/$featureName/domain/usecases/get_$featureName.dart":
    //     "import 'package:dartz/dartz.dart';\n"
    //         "import '../../../../core/error/failures.dart';\n"
    //         "import '../entities/${featureName}_entity.dart';\n"
    //         "import '../repositories/${featureName}_repository.dart';\n\n"
    //         "class Get${featureName.capitalize()} {\n"
    //         "  final ${featureName.capitalize()}Repository repository;\n\n"
    //         "  Get${featureName.capitalize()}(this.repository);\n\n"
    //         "  Future<Either<Failure, ${featureName.capitalize()}Entity>> call(String id) async {\n"
    //         "    return await repository.get${featureName.capitalize()}(id);\n"
    //         "  }\n"
    //         "}",

    // // Presentation files
    // "features/$featureName/presentation/bloc/${featureName}_bloc.dart": "import 'package:bloc/bloc.dart';\n"
    //     "import 'package:equatable/equatable.dart';\n"
    //     "import '../../domain/usecases/get_$featureName.dart';\n"
    //     "import '../../domain/entities/${featureName}_entity.dart';\n\n"
    //     "part '${featureName}_event.dart';\n"
    //     "part '${featureName}_state.dart';\n\n"
    //     "class ${featureName.capitalize()}Bloc extends Bloc<${featureName.capitalize()}Event, ${featureName.capitalize()}State> {\n"
    //     "  final Get${featureName.capitalize()} get${featureName.capitalize()};\n\n"
    //     "  ${featureName.capitalize()}Bloc({required this.get${featureName.capitalize()}}) : super(${featureName.capitalize()}Initial());\n\n"
    //     "  @override\n"
    //     "  Stream<${featureName.capitalize()}State> mapEventToState(${featureName.capitalize()}Event event) async* {\n"
    //     "    if (event is Get${featureName.capitalize()}Event) {\n"
    //     "      yield ${featureName.capitalize()}Loading();\n"
    //     "      final failureOr${featureName.capitalize()} = await get${featureName.capitalize()}(event.id);\n"
    //     "      yield failureOr${featureName.capitalize()}.fold(\n"
    //     "        (failure) => ${featureName.capitalize()}Error(message: 'Error fetching $featureName'),\n"
    //     "        (entity) => ${featureName.capitalize()}Loaded($featureName: entity),\n"
    //     "      );\n"
    //     "    }\n"
    //     "  }\n"
    //     "}\n",
    // "features/$featureName/presentation/bloc/${featureName}_event.dart":
    //     "part of '${featureName}_bloc.dart';\n\n"
    //         "abstract class ${featureName.capitalize()}Event extends Equatable {\n"
    //         "  const ${featureName.capitalize()}Event();\n\n"
    //         "  @override\n"
    //         "  List<Object> get props => [];\n"
    //         "}\n\n"
    //         "class Get${featureName.capitalize()}Event extends ${featureName.capitalize()}Event {\n"
    //         "  final String id;\n\n"
    //         "  const Get${featureName.capitalize()}Event({required this.id});\n\n"
    //         "  @override\n"
    //         "  List<Object> get props => [id];\n"
    //         "}\n",
    // "features/$featureName/presentation/bloc/${featureName}_state.dart":
    //     "part of '${featureName}_bloc.dart';\n\n"
    //         "abstract class ${featureName.capitalize()}State extends Equatable {\n"
    //         "  const ${featureName.capitalize()}State();\n\n"
    //         "  @override\n"
    //         "  List<Object> get props => [];\n"
    //         "}\n\n"
    //         "class ${featureName.capitalize()}Initial extends ${featureName.capitalize()}State {}\n\n"
    //         "class ${featureName.capitalize()}Loading extends ${featureName.capitalize()}State {}\n\n"
    //         "class ${featureName.capitalize()}Loaded extends ${featureName.capitalize()}State {\n"
    //         "  final ${featureName.capitalize()}Entity $featureName;\n\n"
    //         "  const ${featureName.capitalize()}Loaded({required this.$featureName});\n\n"
    //         "  @override\n"
    //         "  List<Object> get props => [$featureName];\n"
    //         "}\n\n"
    //         "class ${featureName.capitalize()}Error extends ${featureName.capitalize()}State {\n"
    //         "  final String message;\n\n"
    //         "  const ${featureName.capitalize()}Error({required this.message});\n\n"
    //         "  @override\n"
    //         "  List<Object> get props => [message];\n"
    //         "}\n",
    // "features/$featureName/presentation/pages/${featureName}_page.dart":
    //     "import 'package:flutter/material.dart';\n"
    //         "import 'package:flutter_bloc/flutter_bloc.dart';\n"
    //         "import '../bloc/${featureName}_bloc.dart';\n\n"
    //         "class ${featureName.capitalize()}Page extends StatelessWidget {\n"
    //         "  @override\n"
    //         "  Widget build(BuildContext context) {\n"
    //         "    return Scaffold(\n"
    //         "      appBar: AppBar(title: Text('${featureName.capitalize()}')),\n"
    //         "      body: BlocProvider(\n"
    //         "        create: (context) => ${featureName.capitalize()}Bloc(get${featureName.capitalize()}: Get${featureName.capitalize()}()),\n"
    //         "        child: ${featureName.capitalize()}View(),\n"
    //         "      ),\n"
    //         "    );\n"
    //         "  }\n"
    //         "}\n\n"
    //         "class ${featureName.capitalize()}View extends StatelessWidget {\n"
    //         "  @override\n"
    //         "  Widget build(BuildContext context) {\n"
    //         "    return Center(\n"
    //         "      child: Column(\n"
    //         "        mainAxisAlignment: MainAxisAlignment.center,\n"
    //         "        children: <Widget>[\n"
    //         "          Text('${featureName.capitalize()} Page'),\n"
    //         "        ],\n"
    //         "      ),\n"
    //         "    );\n"
    //         "  }\n"
    //         "}\n",
    // "features/$featureName/presentation/widgets/${featureName}_widget.dart":
    //     "import 'package:flutter/material.dart';\n"
    //         "import '../bloc/${featureName}_bloc.dart';\n\n"
    //         "class ${featureName.capitalize()}Widget extends StatelessWidget {\n"
    //         "  final ${featureName.capitalize()}Entity $featureName;\n\n"
    //         "  ${featureName.capitalize()}Widget({required this.$featureName});\n\n"
    //         "  @override\n"
    //         "  Widget build(BuildContext context) {\n"
    //         "    return Card(\n"
    //         "      child: ListTile(\n"
    //         "        title: Text($featureName.name),\n"
    //         "      ),\n"
    //         "    );\n"
    //         "  }\n"
    //         "}\n",
  };

  exampleFiles.forEach((filePath, content) {
    var file = File("${baseDir.path}/$filePath");
    if (!file.existsSync()) {
      file.writeAsStringSync(content);
    }
  });

  print("Clean architecture structure for feature '$featureName'");
}

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print("Usage: dart create_clean_architecture.dart <feature_name>");
  } else {
    var featureName = arguments[0];
    createCleanArchitecture(featureName);
  }
}
