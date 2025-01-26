import 'dart:io';

class User {
    String account = "";
    String password = "";
    double balance = 0.0;
    List<String> transferHistory = [] ;

    User(this.account, this.password, this.balance,  this.transferHistory) ;

}

// 全局用户列表
Map<String, User> users = {} ;
void main() {
while(true){
  print('''欢迎进入银行系统，请选择：
1. 开设账户
2. 登录账户
3. 查询所有账户信息
4. 退出程序
请输入您的选择：''');
  //get input
  String? input = stdin.readLineSync();
  switch(input){
    case "1":
      createAccount();
      break;
    case "2":
      login();
      break;
    case '3':
      queryAll(users); // 查询所有账户信息
      break;
    case '4':
      print('退出登录，感谢使用！');
      return;
    default:
      print('无此类选择，请重新输入！');

  }
}


}

void createAccount(){
  print('请输入账户名：');
  String? account = stdin.readLineSync();

  // 检查账户名是否已存在
  if (users.containsKey(account)) {
    print('账户名已存在，请尝试其他名称！');
    return;
  }

  print('请输入密码：');
  String? password = stdin.readLineSync();

  print('请输入初始存款金额：');
  String? balanceInput = stdin.readLineSync();
  double balance = double.tryParse(balanceInput ?? '0') ?? 0;

  if (balance < 0) {
    print('存款金额不能为负数！');
    return;
  }

  // 创建并添加用户
  users[account!] = User(account, password ?? '', balance, []);
  print('账户创建成功！账户名：$account，余额：￥$balance');
}

void login(){
  print('请输入账户名：');
  String? account = stdin.readLineSync();

  print('请输入密码：');
  String? password = stdin.readLineSync();

  // 查找用户
  User? user = users[account] as User?;
  if (user == null || user.password != password) {
    print('登录失败，账户名或密码错误！');
    return;
  }

  print('登录成功！欢迎 $account');
  userMenu(user);
}

// 登录后的菜单
void userMenu(User user) {
  while (true) {
    print('''
欢迎 ${user.account}，选择操作：
1. 查看账户余额
2. 转账
3. 查看转账记录
4. 退出登录
请输入您的选择：
''');

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        print('您的账户余额为：￥${user.balance}');
        break;
      case '2':
        makeTransfer(user); // 转账功能
        break;
      case '3':
        print('您的转账记录：');
        if (user.transferHistory.isEmpty) {
          print('暂无转账记录。');
        } else {
          user.transferHistory.forEach(print);
        }
        break;
      case '4':
        print('退出登录，感谢使用！');
        return;
      default:
        print('无效的选择，请重新输入！');
    }
  }
}

// 转账功能
void makeTransfer(User user) {
  print('请输入目标账户名：');
  String? targetAccount = stdin.readLineSync();

  // 查找目标用户
  User? targetUser = users[targetAccount] as User?;
  if (targetUser == null) {
    print('目标账户不存在！');
    return;
  }

  print('请输入转账金额：');
  String? amountInput = stdin.readLineSync();
  double amount = double.tryParse(amountInput ?? '0') ?? 0;

  if (amount <= 0) {
    print('转账金额必须大于0！');
    return;
  }
  if (user.balance < amount) {
    print('余额不足，转账失败！');
    return;
  }

  // 执行转账
  user.balance -= amount;
  targetUser.balance += amount;

  // 更新转账记录
  user.transferHistory.add('转出：￥$amount 给 ${targetUser.account}');
  targetUser.transferHistory.add('转入：￥$amount 来自 ${user.account}');

  print('转账成功！您的余额为：￥${user.balance}');
}


void queryAll(Map<String, User> users){
  print('所有账户信息如下：');
  if (users.isEmpty) {
    print('暂无账户信息。');
  } else {
    print('账户信息及余额：');
    users.forEach((account, a) {
      print('账户：$account，余额：\$${a.balance.toStringAsFixed(2)}');
    });
  }
}

extension on List<String> {
  get balance => null;
}






