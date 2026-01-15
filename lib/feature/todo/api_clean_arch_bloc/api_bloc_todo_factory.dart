import 'package:revision_master/feature/todo/api_clean_arch_bloc/presentation/ui/api_bloc_todo_app.dart';
import 'data/datasrc/api_todo_remote_ds.dart';
import 'data/repo_impl/api_todo_repo_impl.dart';
import 'domain/usecase/api_fetch_todo_usecase.dart';

class ApiBlocTodoFactory {
  static ApiBlocTodoApp create() {
    final remote = ApiTodoRemoteDs();
    final repo = ApiTodoRepoImpl(remoteDs: remote);
    final usecase = ApiFetchTodoUsecase(repo);

    return ApiBlocTodoApp(apiFetchTodoUsecase: usecase);
  }
}
