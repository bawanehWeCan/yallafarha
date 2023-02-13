import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  static const double _space = 10;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy policy".tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Privacy Policy:", style: headline),
              const Text("Privacy Statement"),
              const Text("The Website Management shall, to the extent permitted under the Regulated Law, undertake not to disclose any personal information about the User such as address, telephone number, email address, etc."),
              const Text("Moreover, none of that information will be exchanged, traded or sold to any other party as long as it is within the limits of the potential website management capabilities, and access to the information will only be allowed to qualified and professional people who oversee the Yalla Farha website."),
              const SizedBox(height: 12),
              Text("Disclaimer of legal responsibility", style: headline),
              const Text("The user acknowledges that he is solely responsible for the nature of the use he identifies for the website Yalla Farha The management of the Yalla Farha Website shall, to the maximum extent permitted by law, dispose of all liability for any loss, damage, expense or expense incurred by the User or by any other Party as a result of the use or inability to use the Website."),
              Text("Service Interpretation, Omissions and Errors", style: headline),
              const Text("Website management does its utmost to ensure that the website continues to operate without problems. However, errors, omissions, interruptions and delays may occur at any time. In such cases, we will expect users to be patient until the service returns to normal condition."),
              Text("Subscriber account, password and information security", style: headline),
              const Text("• The subscriber selects a password for the subscriber's account, an e-mail of which the subscriber is responsible for protecting the mail and password and not sharing or publishing it on the subscriber"),
              const Text("If any transactions occur using this account, the subscriber will assume all the responsibilities involved. He is also obliged to provide his correct information and the e-mail belongs to him. Otherwise, he bears the legal consequences of providing any information that does not indicate his true identity without the slightest responsibility on the Yalla Farha website.Subscribers take full responsibility for all of their content, which they upload and post via the website"),
              const Text("• The user is obliged not to agree with a seller or buyer to deal with him outside the Yalla Farha website. Failure to do so exposes the user to suspend his account and exposes himself to legal liability in case of damage to Yalla Farha."),
              const Text("The subscriber shall abide by the terms of use and shall not publish any content contrary to Islamic law or use the site for illegal purposes, but not limited to, such as:"),
              const Text("Piracy, dissemination and distribution of copied material or software, deception, forgery, fraud, threat, inconvenience to any person, company, group, dissemination of pornography, sex, dissemination of viruses or espionage files, or links to sites containing such infractions."),
              const Text("The infringement of intellectual property rights or the defamation of a person, enterprise or company or the deliberate dissemination of any information causing harm to a company, person, State or group shall be prohibited, and the subscriber shall be fully responsible for whatever he or she provides through his or her account on the site."),
              const Text("It is strictly forbidden to use the website's services for political purposes and to prevent exposure to any Arab or Islamic State in any way."),
              const SizedBox(height: 12),
              Text("Registration", style: headline),
              const Text("Some parts of the site are only open to registered subscribers after providing some real personal information about them When registered on the site, the subscriber agrees that the information provided by the party is complete and accurate, and is obliged that he/she will not register on the site or attempt to enter it into another subscriber name and will not use a name that the administration may deem inappropriate, such as Telephone numbers, impersonated names of famous characters, site links, incomprehensible names, etc. He is also obliged not to register more than one account at Yalla Farha website and when using the same person for more than one account, he offers all his accounts to be permanently discontinued."),
              const SizedBox(height: 12),
              Text("Content Censorship", style: headline),
              const Text("The Yalla Farha Website Management reserves the right to monitor any content entered by the subscriber without necessity, as it cannot monitor all subscriber input It therefore reserves the right (without obligation) to delete, remove or edit any input material that would violate the terms and conditions of the site without reference to the user, Local, international and foreign copyright laws and international treaties protect all the contents of this website. By subscribing to it, the subscriber expressly agrees to be bound by the copyright notices appearing on its pages."),
              const Text("This policy is subject to constant change and development, please review it periodically and contact us through the Help Center to inquire about any of its items."),
            ],
          ),
        ),
      ),
    );
  }
}
