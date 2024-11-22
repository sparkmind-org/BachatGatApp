import 'package:flutter/material.dart';
import '../../models/member.dart';
import '../info_chip.dart';
import 'profile_image.dart';
import 'credit_status.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  final VoidCallback onEdit;
  final VoidCallback onViewDetails;

  const MemberCard({
    super.key,
    required this.member,
    required this.onEdit,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImage(
                  imagePath: member.profileImage,
                  tooltip: '${member.name} - ${member.role}',
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildMetrics(),
                    ],
                  ),
                ),
                _buildMenuButton(),
              ],
            ),
            const SizedBox(height: 12),
            _buildContactInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetrics() {
    final creditScore = int.parse(member.creditScore);
    final status = CreditStatus.fromScore(creditScore);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoChip(
          icon: Icons.credit_score,
          value: member.creditScore,
          color: status.color,
          tooltip: 'Credit Status: ${status.status}',
          title: 'Credit Score',
          description: 'Your credit score is a numerical expression of your creditworthiness based on an analysis of your credit files.',
          details: [
            'Score Range: 300-850',
            'Current Status: ${status.status}',
            'Last Updated: Today',
            'Factors affecting your score: Payment history, credit utilization, length of credit history',
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            InfoChip(
              icon: Icons.savings,
              value: '\$${member.savings}',
              color: Colors.green,
              tooltip: 'Total Savings',
              title: 'Savings Account',
              description: 'Your total savings represent the accumulated funds in your account.',
              details: [
                'Current Balance: \$${member.savings}',
                'Interest Rate: 2.5% APY',
                'Last Transaction: Yesterday',
                'Account Type: High-Yield Savings',
              ],
            ),
            const SizedBox(width: 8),
            InfoChip(
              icon: Icons.account_balance,
              value: '\$${member.loan}',
              color: Colors.orange,
              tooltip: 'Outstanding Loan',
              title: 'Loan Status',
              description: 'Your current outstanding loan balance and related information.',
              details: [
                'Outstanding Amount: \$${member.loan}',
                'Interest Rate: 5.9% APR',
                'Next Payment Due: 15th of next month',
                'Loan Type: Personal Loan',
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuButton() {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.more_vert, color: Colors.grey),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.edit, color: Colors.blue, size: 20),
              ),
              const SizedBox(width: 12),
              const Text("Edit Member", style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.info, color: Colors.green, size: 20),
              ),
              const SizedBox(width: 12),
              const Text("View Details", style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 0) {
          onEdit();
        } else if (value == 1) {
          onViewDetails();
        }
      },
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.phone, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                member.mobile,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.work, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                member.role,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}