import 'package:codecraft/core/services/project_services/new_project_service.dart';

class NewProjectViewModel{
  static Future<void> createNewProject()async {

    await NewProjectService.newProject()
  }
}