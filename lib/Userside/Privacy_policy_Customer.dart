import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyUserDriver extends StatelessWidget {
  const PrivacyPolicyUserDriver({Key? key}) : super(key: key);

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
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy for Users',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your privacy is important to us. This privacy policy explains how we collect, use, and disclose your personal information as a user of our rideshare app. By using our services, you agree to the terms and practices described in this policy.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                'Privacy Policy for Drivers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your privacy is important to us. This privacy policy explains how we collect, use, and disclose your personal information as a driver using our rideshare app. By logging in to the app and using our services, you agree to the terms and practices described in this policy.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                '1. Information We Collect',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We may collect the following types of information:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '- Personal identification information (e.g., name, email address, phone number)',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Driver\'s license information and vehicle details',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Location information while using the app',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                '2. How We Use Your Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We may use your information for the following purposes:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '- Providing our rideshare services to you',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Verifying your identity and eligibility as a driver/rider',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Communicating with you regarding trip details and updates',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                '3. Information Sharing and Disclosure',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We may share your information with the following parties:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '- Other users/drivers within the app for trip purposes',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Third-party service providers who assist in delivering our services',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Law enforcement or regulatory authorities as required by law',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                '4. Data Security',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We take reasonable measures to protect your information from unauthorized access or disclosure. However, please be aware that no security measures are foolproof.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                '5. Changes to this Policy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We may update this privacy policy from time to time. We will notify you of any significant changes by posting the updated policy on our website or through other communication channels.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Text(
                '6. Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
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
