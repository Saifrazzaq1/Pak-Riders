import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(
            'Privacy Policy for Drivers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your privacy is important to us. This privacy policy explains how we collect, use, and disclose your personal information as a driver using our rideshare app. By logging in to the app and using our services, you agree to the terms and practices described in this policy.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            '1. Information We Collect',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'We may collect the following types of information:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            '- Personal identification information (e.g., name, email address, phone number)',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
              '- Driver license information and vehicle details',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '- Location information while using the app',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          '2. How We Use Your Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'We may use your information for the following purposes:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          '- Providing our rideshare services to you',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '- Verifying your identity and eligibility as a driver',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '- Communicating with you regarding trip details and updates',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          '3. Information Sharing and Disclosure',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'We may share your information with the following parties:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          '- Riders who request rides through our app',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '- Third-party service providers who assist in delivering our services',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '- Law enforcement or regulatory authorities as required by law',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          '4. Data Security',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'We take reasonable measures to protect your information from unauthorized access or disclosure. However, please be aware that no security measures are foolproof.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          '5. Changes to this Policy',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'We may update this privacy policy from time to time. We will notify you of any significant changes by posting the updated policy on our website or through other communication channels.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          '6. Contact Us',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'If you have any questions or concerns about our privacy policy, please contact us at support@example.com.',
          style: TextStyle(fontSize: 16),
        ),
        ],
      ),
    ),
    ),
    );
  }
}

