import 'dart:io';

void main() {
  final commitFile = File('${Directory.current.path}/.git/COMMIT_EDITMSG');
  final regExp = RegExp(r'(feat|test|refactor|chore|fix|docs|style)(\(.*\))?:\s?.+');

  final commitMessage = commitFile.readAsStringSync();
  final isValid = regExp.hasMatch(commitMessage);

  if (!isValid) {
    // ignore: avoid_print
    print('Commit message is not valid');
    exitCode = 1;
  }
}
