import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormPages extends StatefulWidget {
  const FormPages({super.key});

  @override
  State<FormPages> createState() => _FormPagesState();
}

class _FormPagesState extends State<FormPages> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  List<String> list = [];

  bool _isPasswordVisible = false;
  String? _emailError;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Form Pages"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          key: _emailFieldKey,
                          name: 'email',
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 20),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _togglePasswordVisibility,
                            ),
                            errorText: 'Password Tidak sesuai',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ]),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() => _emailError = null);
                            if (await _formKey.currentState!
                                .saveAndValidate()) {
                              setState(
                                  () => _emailError = 'Email tidak valid.');
                              return;
                            } else {
                              setState(() {
                                list.add(_emailFieldKey.currentState?.value);
                                _emailError = null;
                              });
                            }

                            final formData = _emailFieldKey.currentState?.value;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Form submitted successfully! Form Data: $formData')),
                            );
                          },
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemBuilder: (item, index) => Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                list.removeAt(
                                    index); // Modify the list inside setState
                              });
                            },
                            child: Text(
                              '${list[index]}',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      itemCount: list.length,
                    ),
                  )
                ],
              ),
            )));
  }
}

// SizedBox(height: 20),
// Text("data"),
// ListView.builder(
// itemBuilder: (item, index) => Text(list[index]),
// itemCount: list.length,
// ),
