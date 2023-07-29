import 'package:flutter/material.dart';

class PatientRegistrationView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final List<String> _genders = ['Masculino', 'Feminino', 'Outro'];
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Paciente'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do paciente',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (value) {
                _selectedGender = value;
              },
              items: _genders.map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Gênero',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                _onSaveButtonPressed(context);
              },
              child: Text('Salvar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSaveButtonPressed(BuildContext context) {
    final name = _nameController.text;
    final age = _ageController.text;
    final gender = _selectedGender;

    // Implementar a lógica para salvar os dados do paciente no banco de dados
    // ou enviá-los para um serviço de backend.

    // Exemplo de exibição de uma mensagem de sucesso:
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sucesso'),
          content: Text('Paciente cadastrado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
