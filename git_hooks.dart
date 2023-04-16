import "package:git_hooks/git_hooks.dart";
import "dart:io";

void main(List<String> arguments) {
  Map<Git, UserBackFun> params = {
    Git.prePush: prePush,
    Git.preCommit: preCommit
  };
  List<String> args = List<String>.from(arguments);
  GitHooks.call(args, params);
}

Future<bool> prePush() async {
  try {
    // Format the code using dartfmt
    ProcessResult formatResult = await Process.run('dartfmt', ['-w', '.']);
    if (formatResult.exitCode != 0) return false;

    ProcessResult analyzeResult = await Process.run('flutter', ['analyze']);
    print(analyzeResult.stdout);
    if (analyzeResult.exitCode != 0) return false;

    ProcessResult testResult = await Process.run('flutter', ['test']);
    print(testResult.stdout);
    if (testResult.exitCode != 0) return false;
  } catch (e) {
    return false;
  }
  return true;
}

Future<bool> preCommit() async {
  try {
    ProcessResult result = await Process.run('dartanalyzer', ['bin']);
    print(result.stdout);
    if (result.exitCode != 0) return false;
  } catch (e) {
    return false;
  }
  return true;
}
