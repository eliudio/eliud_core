import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/policy_presentation_component.dart';
import 'package:eliud_core/model/policy_presentation_model.dart';
import 'package:eliud_core/model/policy_presentation_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class PolicyPresentationComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
    return PolicyPresentation(id: id);
  }
}

class PolicyPresentation extends AbstractPolicyPresentationComponent {
  PolicyPresentation({String id}) : super(policyPresentationID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(BuildContext context, PolicyPresentationModel policyPresentationModel) {
    if ((policyPresentationModel != null) || (policyPresentationModel.policy != null) || (policyPresentationModel.policy.html != null)) {
      return Text(policyPresentationModel.policy.html);
    } else {
      return Text('No html specified');
    }
  }

  @override
  PolicyPresentationRepository getPolicyPresentationRepository(BuildContext context) {
    return policyPresentationRepository(appId: AccessBloc.appId(context));
  }
}
