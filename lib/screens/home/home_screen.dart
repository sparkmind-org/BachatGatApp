import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/custom_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTabIndex = 0; // 0: Group Overview, 1: Insights
  int _currentListIndex = 0; // 0: Defaulters, 1: Contributors, 2: Pending Saving EMI, 3: Pending Loan EMI

  // Bottom navigation bar handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/members');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/menu');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with search bar and bell icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Search Bar
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Bell Icon
                  SvgPicture.asset(
                    'assets/icon/Bellicon.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),

            // Toggle buttons for "Group Overview" and "Insights"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _currentTabIndex = 0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          color: _currentTabIndex == 0
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'Group Overview',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _currentTabIndex = 1),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          color: _currentTabIndex == 1
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'Insights',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Content
            Expanded(
              child: _currentTabIndex == 0
                  ? _buildGroupOverview()
                  : _buildInsights(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Group Overview Content
  Widget _buildGroupOverview() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cards Layout
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildCard('Total Group Savings', '₹5,00,000.00', Colors.green),
              _buildCard('Current Bank Balance', '₹5,00,000.00', Colors.blue),
              _buildCard('Bachat Gat Loan/Subsidy', '₹5,00,000.00', Colors.orange),
              _buildCard('Total Penalties Collected', '₹10,000.00', Colors.red),
              _buildCard('Upcoming Loan Dues', '₹1,00,000.00', Colors.purple),
              _buildCard('Pending Contributions', '₹25,000.00', Colors.teal),
              _buildCard('Loan Repayment Percentage', '70%', Colors.redAccent),
            ],
          ),
          const SizedBox(height: 16.0),

          // Toggle list types as tabs
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                // Tab headers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabButton(0, 'Defaulters'),
                    _buildTabButton(1, 'Contributors'),
                    _buildTabButton(2, 'Pending Saving EMI'),
                    _buildTabButton(3, 'Pending Loan EMI'),
                  ],
                ),
                const Divider(height: 1.0),

                // Tab content
                if (_currentListIndex == 0) _buildDefaulterList(),
                if (_currentListIndex == 1) _buildContributorList(),
                if (_currentListIndex == 2) _buildPendingSavingList(),
                if (_currentListIndex == 3) _buildPendingLoanList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsights() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInsightsCard(
          title: 'Savings Growth Over Time',
          chartWidget: _buildSavingsGrowthChart(),
        ),
        const SizedBox(height: 16.0),
        _buildInsightsCard(
          title: 'Loan Repayment Progress',
          chartWidget: _buildLoanRepaymentChart(),
        ),
        const SizedBox(height: 16.0),
        _buildInsightsCard(
          title: 'Monthly Collection Trend',
          chartWidget: _buildMonthlyCollectionChart(),
        ),
      ],
    ),
  );
}


  // Reusable Tab Button
  Widget _buildTabButton(int index, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentListIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _currentListIndex == index
                    ? Colors.blue
                    : Colors.transparent,
                width: 2.0,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _currentListIndex == index ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // Reusable Widgets
  Widget _buildCard(String title, String value, Color color) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            value,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaulterList() {
    return _buildList([
      {'name': 'Pratham Babre', 'amount': '- ₹10,944.00', 'date': '10 Oct 2024'},
      {'name': 'Balu Babre', 'amount': '- ₹8,844.00', 'date': '18 Sep 2024'},
    ]);
  }

  Widget _buildContributorList() {
    return _buildList([
      {'name': 'John Doe', 'amount': '+ ₹5,000.00', 'date': '15 Nov 2024'},
    ]);
  }

  Widget _buildPendingSavingList() {
    return _buildList([
      {'name': 'User A', 'amount': '- ₹3,000.00', 'date': 'Pending'},
    ]);
  }

  Widget _buildPendingLoanList() {
    return _buildList([
      {'name': 'User X', 'amount': '- ₹15,000.00', 'date': 'Pending'},
    ]);
  }

  Widget _buildList(List<Map<String, String>> items) {
    return Column(
      children: items
          .map(
            (item) => ListTile(
              title: Text(item['name']!),
              subtitle: Text(item['date']!),
              trailing: Text(
                item['amount']!,
                style: TextStyle(
                  color: item['amount']!.contains('-') ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildInsightsCard({required String title, required Widget chartWidget}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6.0,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 200.0,
          child: chartWidget,
        ),
      ],
    ),
  );
}
Widget _buildSavingsGrowthChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 20),
              FlSpot(1, 10),
              FlSpot(2, 30),
              FlSpot(3, 50),
              FlSpot(4, 40),
              FlSpot(5, 60),
              FlSpot(6, 30),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.1),
            ),
            dotData: FlDotData(show: true), // Display dots
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 20,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final labels = ['3', '6', '9', '12', '15', '18', '21', '24', '27', '30'];
                if (value.toInt() < labels.length) {
                  return Text(
                    labels[value.toInt()],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          border: const Border(
            bottom: BorderSide(color: Colors.black12),
            left: BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }


  
Widget _buildLoanRepaymentChart() {
  return BarChart(
    BarChartData(
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 30,
              color: Colors.blue,
              width: 12,
            ),
            BarChartRodData(
              toY: 50,
              color: Colors.grey.withOpacity(0.3),
              width: 12,
            ),
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 40,
              color: Colors.blue,
              width: 12,
            ),
            BarChartRodData(
              toY: 70,
              color: Colors.grey.withOpacity(0.3),
              width: 12,
            ),
          ],
        ),
        // Add more BarChartGroupData for each month as needed
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 20,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final labels = ['Jan', 'Mar', 'May', 'Jul', 'Sep', 'Nov'];
              if (value.toInt() < labels.length) {
                return Text(
                  labels[value.toInt()],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(show: false), // Remove grid lines
      borderData: FlBorderData(show: false),
    ),
  );
}

Widget _buildMonthlyCollectionChart() {
  return LineChart(
    LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 30),
            FlSpot(1, 50),
            FlSpot(2, 20),
            FlSpot(3, 60),
            FlSpot(4, 40),
            FlSpot(5, 80),
            FlSpot(6, 70),
          ],
          isCurved: true,
          color: Colors.green,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            color: Colors.green.withOpacity(0.1),
          ),
          dotData: FlDotData(show: false),
        ),
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 20,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              final labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
              if (value.toInt() < labels.length) {
                return Text(
                  labels[value.toInt()],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(show: false), // Remove grid lines
      borderData: FlBorderData(show: false),
    ),
  );
}
}