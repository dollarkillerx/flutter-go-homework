import 'dart:io';

class User {
  String account;
  String password;
  double balance;
  List<String> transferHistory;

  User(this.account, this.password, this.balance) : transferHistory = [];
}

class BankSystem {
  final Map<String, User> users = {};

  void start() {
    while (true) {
      print('''欢迎进入银行系统，请选择：
1. 开设账户
2. 登录账户
3. 查询所有账户信息
4. 退出程序
请输入您的选择：''');
      String? choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          createAccount();
          break;
        case '2':
          login();
          break;
        case '3':
          viewAllAccounts();
          break;
        case '4':
          exit(0);
        default:
          print('无效的选项，请重新输入！');
      }
    }
  }

  void createAccount() {
    print('请输入账户名：');
    String? account = stdin.readLineSync();
    if (account == null || account.isEmpty) {
      print('账户名不能为空！');
      return;
    }
    if (users.containsKey(account)) {
      print('账户名已存在！');
      return;
    }

    print('请输入密码：');
    String? password = stdin.readLineSync();
    if (password == null || password.isEmpty) {
      print('密码不能为空！');
      return;
    }

    print('请输入初始存款金额：');
    double? balance = double.tryParse(stdin.readLineSync() ?? '');
    if (balance == null || balance < 0) {
      print('无效的金额！');
      return;
    }

    users[account] = User(account, password, balance);
    print('账户创建成功！您的账户名为：$account');
    print('请选择：\n1. 返回主菜单\n2. 马上登录');
    String? choice = stdin.readLineSync();
    if (choice == '2') {
      login();
    }
  }

  void login() {
    print('请输入账户名：');
    String? account = stdin.readLineSync();
    print('请输入密码：');
    String? password = stdin.readLineSync();

    User? user = users[account];
    if (user == null || user.password != password) {
      print('登录失败！账户名或密码错误！');
      return;
    }

    print('登录成功！欢迎，$account！');
    while (true) {
      print('''请选择操作：
1. 查询余额
2. 转账
3. 查询转账记录
4. 登出
请输入您的选择：''');
      String? choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          print('您的当前余额为：${user.balance} 元');
          break;
        case '2':
          transfer(user);
          break;
        case '3':
          viewTransferHistory(user);
          break;
        case '4':
          return;
        default:
          print('无效的选项，请重新输入！');
      }
    }
  }

  void transfer(User user) {
    print('请输入收款账户名：');
    String? recipientAccount = stdin.readLineSync();
    User? recipient = users[recipientAccount];
    if (recipient == null) {
      print('收款账户不存在！');
      return;
    }

    print('请输入转账金额：');
    double? amount = double.tryParse(stdin.readLineSync() ?? '');
    if (amount == null || amount <= 0 || amount > user.balance) {
      print('无效的金额或余额不足！');
      return;
    }

    user.balance -= amount;
    recipient.balance += amount;
    user.transferHistory.add('向 $recipientAccount 转账 $amount 元');
    recipient.transferHistory.add('收到 ${user.account} 转账 $amount 元');
    print('转账成功！向 $recipientAccount 转账 $amount 元');
  }

  void viewTransferHistory(User user) {
    if (user.transferHistory.isEmpty) {
      print('暂无转账记录！');
    } else {
      print('您的转账记录如下：');
      for (var record in user.transferHistory) {
        print(record);
      }
    }
  }

  void viewAllAccounts() {
    if (users.isEmpty) {
      print('当前系统中暂无账户！');
    } else {
      print('当前系统中的账户信息如下：');
      users.forEach((account, user) {
        print('账户名：$account，余额：${user.balance} 元');
      });
    }
  }
}

void main() {
  BankSystem bankSystem = BankSystem();
  bankSystem.start();
}