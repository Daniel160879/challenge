import 'package:challenge/decoration/textfield_deco.dart';
import 'package:challenge/domain/estimated_age.dart';
import 'package:challenge/provider/estimated_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  EstimatedAge? estimatedAge;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Alter schätzen lassen'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: TextFormField(
                  decoration: myTextFormFieldDeco,
                  controller: _nameController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Gib bitte einen Namen ein !!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amberAccent),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<EstimatedProvider>().sendNameGetAge(_nameController.text);
                  }
                  _nameController.clear();
                },
                child: const Text(
                  'Alter schätzen',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Consumer<EstimatedProvider>(
                builder: (context, model, child) {
                  if (model.estimatedAge == null) {
                    return const Text('Bitte gib einen Namen ein !!');
                  }
                  return Column(
                    children: [
                      Text('Name : ${model.estimatedAge!.name}', style: myTextDeco),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Geschätztes Alter : ${model.estimatedAge!.age.toString()}', style: myTextDeco),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
