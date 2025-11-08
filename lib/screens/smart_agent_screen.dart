import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:math';

class SmartAgentScreen extends StatefulWidget {
  const SmartAgentScreen({super.key});

  @override
  State<SmartAgentScreen> createState() => _SmartAgentScreenState();
}

class _SmartAgentScreenState extends State<SmartAgentScreen> {
  final _user = const types.User(id: 'user');
  final List<types.Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _addAgentMessage('أهلاً! أنا الوكيل الذكي — اسألني عن البرمجة أو اطلب درسًا. يمكنك تجربة: "علّمني حلقة for في بايثون"');
  }

  void _addAgentMessage(String text) {
    final msg = types.TextMessage(
      author: const types.User(id: 'agent'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Random().nextInt(1000000).toString(),
      text: text,
    );
    setState(() => _messages.insert(0, msg));
  }

  void _handleSendPressed(types.PartialText message) {
    final userMsg = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Random().nextInt(1000000).toString(),
      text: message.text,
    );
    setState(() => _messages.insert(0, userMsg));

    // محاكاة استجابة الذكاء الاصطناعي
    Future.delayed(const Duration(milliseconds: 700), () {
      // هنا يمكنك وضع مناداة API حقيقية (OpenAI أو Dialogflow)
      // مثال:
      // final response = await YourApi.send(message.text);
      // _addAgentMessage(response.text);

      // الآن استجابة تجريبية ذكية:
      final reply = _fakeAgentReply(message.text);
      _addAgentMessage(reply);
    });
  }

  String _fakeAgentReply(String prompt) {
    // منطق بسيط لتوليد ردود نموذجية — استبدله باستدعاء API لاحقًا
    final lower = prompt.toLowerCase();
    if (lower.contains('بايثون') || lower.contains('python')) {
      return 'بايثون لغة ممتازة. ابدأ بتعلم المتغيرات، الحلقات، والقوائم. تريد درسًا قصيرًا عن حلقة for؟';
    }
    if (lower.contains('html') || lower.contains('css') || lower.contains('javascript')) {
      return 'تطوير الويب يبدأ بHTML/CSS ثم JavaScript. هل ترغب بمشروع صغير (صفحة تفاعلية) لتطبيق ما تعلمت؟';
    }
    if (lower.contains('تحدي') || lower.contains('مهمة')) {
      return 'حسنًا! إليك تحدٍ بسيط: اكتب دالة تستقبل قائمة أرقام وتعيد أكبر عنصر فيها. ارسِل الحل وأنا أراجع.';
    }
    return 'فهمت سؤالك: \"$prompt\" — هل تريده في شكل درس قصير أم مثال عملي؟';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الوكيل الذكي')),
      body: SafeArea(
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          showUserAvatars: true,
          showUserNames: false,
        ),
      ),
    );
  }
}
