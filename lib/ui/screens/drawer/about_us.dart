import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  static const double _space = 10;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Yalla Farha".tr,
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
              Text("Privacy Policy", style: headline),
              const Text("Ta2weel aljazera built the تأويل الجزيرة app as an Ad Supported app. This SERVICE is provided by Ta2weel aljazera at no cost and is intended for use as is."),
              const Text("This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service."),
              const Text("If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy."),
              const Text("The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at تأويل الجزيرة unless otherwise defined in this Privacy Policy."),
              const SizedBox(height: _space),
              Text("Information Collection and Use", style: headline),
              const Text("For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Application Interpretation of dreams, by specialists in this science. The information that I request will be retained on your device and is not collected by me in any way."),
              const Text("The app does use third-party services that may collect information used to identify you."),
              const Text("Link to the privacy policy of third-party service providers used by the app:"),
              const Text("• Google Play Services\n• AdMob\n• Google Analytics for Firebase\n• Firebase Crashlytics\n• Facebook\n• Unity"),
              const SizedBox(height: _space),
              Text("Log Data", style: headline),
              const Text("I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics."),
              const SizedBox(height: _space),
              Text("Cookies", style: headline),
              const Text("Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory."),
              const Text("This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
              const SizedBox(height: _space),
              Text("Service Providers", style: headline),
              const Text("I may employ third-party companies and individuals due to the following reasons:"),
              const Text("• To facilitate our Service.\n• To provide the Service on our behalf.\n• To perform Service-related services.\n• To assist us in analyzing how our Service is used.\n"),
              const Text("I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
              const SizedBox(height: _space),
              Text("Security", style: headline),
              const Text("I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security."),
              const SizedBox(height: _space),
              Text("Links to Other Sites", style: headline),
              const Text("This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
              const SizedBox(height: _space),
              Text("Children’s Privacy", style: headline),
              const Text("These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions."),
              const SizedBox(height: _space),
              Text("Changes to This Privacy Policy", style: headline),
              const Text("I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page."),
              const Text("This policy is effective as of 2022-04-12"),
              const SizedBox(height: _space),
              Text("Contact Us", style: headline),
              const Text("If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at taweelaljazera@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }
}
