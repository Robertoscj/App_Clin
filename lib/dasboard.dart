import 'package:app_clin/patient.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Médicos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRegistrationView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Funcionários'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRegistrationView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Pacientes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRegistrationView()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome Dashboard!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  _buildDashboardCard(
                    context,
                    'Doctor',
                    Icons.person,
                    Colors.blue,
                  ),
                  _buildDashboardCard(
                    context,
                    'Employee',
                    Icons.work,
                    Colors.orange,
                  ),
                  _buildDashboardCard(
                    context,
                    'Patient',
                    Icons.local_hospital,
                    Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData iconData,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        // Navegar para a tela correspondente (Doctor, Employee, Patient)
        if (title == 'Patient') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PatientRegistrationView()),
          );
        } else {
          // Navegar para outras telas de acordo com o título do card
        }
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorScreen()));
      },
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 48.0,
                color: Colors.white,
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
