import 'package:app_clin/patient.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
              // Fazer logout e retornar à tela de login
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            },
          ),
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
              leading: Icon(
                Icons.person,
                color: Colors.blue,
                size: 40,
              ),
              title: Text(
                'Médicos',
                style: TextStyle(
                  color: Colors.blue, // Alterar a cor do texto para azul
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRegistrationView()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.orange,
                size: 40,
              ),
              title: Text(
                'Funcionários',
                style: TextStyle(
                  color: Colors.blue, // Alterar a cor do texto para azul
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRegistrationView()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_hospital,
                color: Colors.green,
                size: 40,
              ),
              title: Text(
                'Pacientes',
                style: TextStyle(
                  color: Colors.blue, // Alterar a cor do texto para azul
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Gráfico de Barras',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.center,
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(x: 0, barsSpace: 4, barRods: [
                              BarChartRodData(y: 10, colors: [Colors.blue]),
                            ]),
                            BarChartGroupData(x: 1, barsSpace: 4, barRods: [
                              BarChartRodData(y: 15, colors: [Colors.orange]),
                            ]),
                            BarChartGroupData(x: 2, barsSpace: 4, barRods: [
                              BarChartRodData(y: 20, colors: [Colors.green]),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Gráfico de Linhas',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 50),
                                FlSpot(1, 70),
                                FlSpot(2, 30),
                                FlSpot(3, 90),
                              ],
                              colors: [Colors.blue],
                              isCurved: true,
                              dotData: FlDotData(show: false),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 20),
                                FlSpot(1, 40),
                                FlSpot(2, 10),
                                FlSpot(3, 50),
                              ],
                              colors: [Colors.orange],
                              isCurved: true,
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Gráfico de Pizza',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: [
                            PieChartSectionData(
                                value: 30,
                                color: Colors.blue,
                                title: 'Ortopedia',
                                radius: 60),
                            PieChartSectionData(
                                value: 50,
                                color: Colors.orange,
                                title: 'Cardiologia',
                                radius: 60),
                            PieChartSectionData(
                                value: 20,
                                color: Colors.green,
                                title: 'Dermatologia',
                                radius: 60),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Gráfico de Área',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 80),
                                FlSpot(1, 70),
                                FlSpot(2, 90),
                                FlSpot(3, 60),
                              ],
                              colors: [Colors.blue.withOpacity(0.3)],
                              isCurved: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                  show: true,
                                  colors: [Colors.blue.withOpacity(0.3)]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Gráfico de Radar',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: RadarChart(
                        RadarChartData(
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          radarSpots: [
                            FlSpot(0, 70),
                            FlSpot(1, 80),
                            FlSpot(2, 65),
                            FlSpot(3, 90),
                          ],
                          radarTouchData: RadarTouchData(
                            touchCallback: (response) => print(response),
                            touchTooltipData: RadarTouchTooltipData(
                              tooltipBgColor: Colors.blue.withOpacity(0.7),
                              tooltipRoundedRadius: 8,
                              getTooltipItems: (data) => [
                                RadarTooltipItem(
                                    text: 'Habilidade 1: ${data.spot.y}',
                                    textStyle: TextStyle(color: Colors.white)),
                                RadarTooltipItem(
                                    text: 'Habilidade 2: ${data.spot.y}',
                                    textStyle: TextStyle(color: Colors.white)),
                                RadarTooltipItem(
                                    text: 'Habilidade 3: ${data.spot.y}',
                                    textStyle: TextStyle(color: Colors.white)),
                                RadarTooltipItem(
                                    text: 'Habilidade 4: ${data.spot.y}',
                                    textStyle: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Gráfico de Gantt',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.center,
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: SideTitles(showTitles: false),
                            bottomTitles: SideTitles(
                                showTitles: true,
                                getTitles: (value) => 'Projeto ${value + 1}'),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(x: 0, barsSpace: 4, barRods: [
                              BarChartRodData(y: 7, colors: [Colors.blue]),
                            ]),
                            BarChartGroupData(x: 1, barsSpace: 4, barRods: [
                              BarChartRodData(y: 5, colors: [Colors.orange]),
                            ]),
                            BarChartGroupData(x: 2, barsSpace: 4, barRods: [
                              BarChartRodData(y: 10, colors: [Colors.green]),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
