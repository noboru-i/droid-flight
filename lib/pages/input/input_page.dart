import 'package:flutter/material.dart';
import 'package:droid_flight/pages/home/home_notifier.dart';
import 'package:droid_flight/pages/home/home_state.dart';

class InputPage extends StatelessWidget {
  final HomeNotifier notifier;
  
  const InputPage({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invitationController = TextEditingController();
    final nameController = TextEditingController();
    final categoryController = TextEditingController();
    final tagsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Add beta program'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Enter your app details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              _InputField(
                  hint: 'Invitation link', controller: invitationController),
              const SizedBox(height: 16),
              _InputField(hint: 'App name', controller: nameController),
              const SizedBox(height: 16),
              _InputField(hint: 'Category', controller: categoryController),
              const SizedBox(height: 16),
              _InputField(
                  hint: 'Tags (split by comma)', controller: tagsController),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 64,
                child: FilledButton(
                  onPressed: () async {
                    final tags = tagsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList();
                    final app = BetaAppData(
                      applicationId: invitationController.text,
                      image: '', // 必要に応じて画像URLを追加
                      name: nameController.text,
                      tags: tags,
                      section: categoryController.text.isEmpty
                          ? null
                          : categoryController.text,
                    );
                    await notifier.addBetaApp(app);
                    if (context.mounted) Navigator.of(context).pop();
                  },
                  child: const Text('Join beta'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  const _InputField({required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
