import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


// From https://gdpr.eu/privacy-notice/
const String _gdpr = '''
<html>
<h1>\${appName} Privacy Policy</h1>
<p>This privacy policy will explain how our organization uses the personal data we collect from you when you use our website.</p>
<p>Topics:</p>
<ul>
   <li>What data do we collect?</li>
   <li>How do we collect your data?</li>
   <li>How will we use your data?</li>
   <li>How do we store your data?</li>
   <li>Marketing</li>
   <li>What are your data protection rights?</li>
   <li>What are cookies?</li>
   <li>How do we use cookies?</li>
   <li>What types of cookies do we use?</li>
   <li>How to manage your cookies</li>
   <li>Privacy policies of other websites</li>
   <li>Changes to our privacy policy</li>
   <li>How to contact us</li>
   <li>How to contact the appropriate authorities</li>
</ul>
<h3>What data do we collect?</h3>
<p>\${appName} collects the following data:</p>
<ul>
   <li>Personal identification information (Name, email address, phone number, etc.)</li>
   <li>Shipping and invoice information (Address, City, Country, etc.)</li>
</ul>
<h3>How do we collect your data?</h3>
<p>You directly provide \${appName} with all of the data we collect. We collect data and process data when you:</p>
<ul>
   <li>Register online or place an order for any of our products or services.</li>
   <li>Voluntarily complete a customer survey or provide feedback on any of our message boards or via email.</li>
   <li>Use or view our website via your browser’s cookies.</li>
</ul>
<h3>How will we use your data?</h3>
<p>\${appName} collects your data so that we can:</p>
<ul>
   <li>Process your order and manage your account.</li>
   <li>Email you with special offers on other products and services we think you might like.</li>
</ul>
<p>When \${appName} processes your order, it may send your data to, and also use the resulting information from, credit reference agencies to prevent fraudulent purchases.</p>
<h3>How do we store your data?</h3>
<p>\${appName} securely stores your data at Google Data Centers.</p>
<p>\${appName} will keep your information for 1 year since you last logged on. Once this time period has expired, we will delete your data automatically.</p>
<h3>Marketing</h3>
<p>\${appName} would like to send you information about products and services of ours that we think you might like.</p>
<p></p>
<p>If you have agreed to receive marketing, you may always opt out at a later date.</p>
<p>You have the right at any time to stop \${appName} from contacting you for marketing purposes.</p>
<p>If you no longer wish to be contacted for marketing purposes, please click here.</p>
<h3>What are your data protection rights?</h3>
<p>\${appName} would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>
<p><strong>The right to access</strong> &#8211; You have the right to request \${appName} for copies of your personal data. We may charge you a small fee for this service.</p>
<p><strong>The right to rectification</strong> &#8211; You have the right to request that \${appName} correct any information you believe is inaccurate. You also have the right to request \${appName} to complete the information you believe is incomplete.</p>
<p><strong>The right to erasure</strong> – You have the right to request that \${appName} erase your personal data, under certain conditions.</p>
<p><strong>The right to restrict processing</strong> &#8211; You have the right to request that \${appName} restrict the processing of your personal data, under certain conditions.</p>
<p><strong>The right to object to processing</strong> &#8211; You have the right to object to \${appName}’s processing of your personal data, under certain conditions.</p>
<p><strong>The right to data portability</strong> &#8211; You have the right to request that \${appName} transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p>
<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us at our email:</p>
<p>Call us at:</p>
<p>Or write to us:</p>
<h3>Cookies</h3>
<p>Cookies are text files placed on your computer to collect standard Internet log information and visitor behavior information. When you visit our websites, we may collect information from you automatically through cookies or similar technology</p>
<p>For further information, visit allaboutcookies.org.</p>
<h3>How do we use cookies?</h3>
<p>\${appName} uses cookies in a range of ways to improve your experience on our website, including:</p>
<ul>
   <li>Keeping you signed in</li>
   <li>Understanding how you use our website</li>
   <li>Keep track of your shopping bag</li>
</ul>
<h3>What types of cookies do we use?</h3>
<p>There are a number of different types of cookies, however, our website uses:</p>
<ul>
   <li>Functionality – \${appName} uses these cookies so that we recognize you on our website and remember your previously selected preferences. These could include what language you prefer and location you are in. A mix of first-party and third-party cookies are used.</li>
   <li>Advertising – \${appName} uses these cookies to collect information about your visit to our website, the content you viewed, the links you followed and information about your browser, device, and your IP address. \${appName} sometimes shares some limited aspects of this data with third parties for advertising purposes. We may also share online data collected through cookies with our advertising partners. This means that when you visit another website, you may be shown advertising based on your browsing patterns on our website.</li>
</ul>
<h3>How to manage cookies</h3>
<p>You can set your browser not to accept cookies, and the above website tells you how to remove cookies from your browser. However, in a few cases, some of our website features may not function as a result.</p>
<h3>Privacy policies of other websites</h3>
<p>The \${appName} website contains links to other websites. Our privacy policy applies only to our website, so if you click on a link to another website, you should read their privacy policy.</p>
<h3>Changes to our privacy policy</h3>
<p>\${appName} keeps its privacy policy under regular review and places any updates on this web page. This privacy policy was last updated on 9 January 2019.</p>
<h3>How to contact us</h3>
<p>If you have any questions about \${appName}’s privacy policy, the data we hold on you, or you would like to exercise one of your data protection rights, please do not hesitate to contact us.</p>
<p>\${email}</p>

</html>
''';

class AcceptMembershipWidget extends StatefulWidget {
  final AppModel app;
  final MemberModel member;
  final FirebaseUser usr;

  const AcceptMembershipWidget(
    this.app,
    this.member,
    this.usr, {
    Key key,
  }) : super(key: key);

  @override
  _AcceptMembershipWidgetState createState() => _AcceptMembershipWidgetState();
}

class _AcceptMembershipWidgetState extends State<AcceptMembershipWidget>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  void _addButtons(List<Widget> widgets) {
    widgets.add(Row(children: <Widget>[
      RaisedButton(
        color: RgbHelper.color(rgbo: widget.app.formSubmitButtonColor),
        onPressed: () async {
          BlocProvider.of<AccessBloc>(context)
              .add(AcceptedMembership(widget.member, widget.usr));
        },
        child: Text('Accept',
            style: TextStyle(
                color: RgbHelper.color(
                    rgbo: widget.app.formSubmitButtonTextColor))),
      ),
      Container(width: 10),
      RaisedButton(
        color: RgbHelper.color(rgbo: widget.app.formSubmitButtonColor),
        onPressed: () async {
          BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
        },
        child: Text('Cancel',
            style: TextStyle(
                color: RgbHelper.color(
                    rgbo: widget.app.formSubmitButtonTextColor))),
      ),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    var app = AppBloc.app(context);
    var accessState = AccessBloc.getState(context);
    var widgets = <Widget>[];
    widgets.add(HtmlWidget(
        process(_gdpr, parameters: <String, String>{
          '\${appName}': app.title,
          '\${email}': app.email,
        }),
        webView: false));

    widgets.add(Text(''));
    _addButtons(widgets);

    return Container(
        decoration: BoxDecorationHelper.boxDecoration(accessState,
            app.formAppBarBackground),
        child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: widgets.length,
              itemBuilder: (BuildContext context, int index) {
                return widgets[index];
              },
            )));
  }
}
