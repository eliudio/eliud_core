import 'dart:io';
import 'dart:typed_data';

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/policy_presentation_component.dart';
import 'package:eliud_core/model/policy_presentation_model.dart';
import 'package:eliud_core/model/policy_presentation_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:permission_handler/permission_handler.dart';

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
    if ((policyPresentationModel != null) || (policyPresentationModel.policy != null)) {
      // download pdf from url
      return FutureBuilder<Uint8List>(
          future: DownloadFile.downloadFile(policyPresentationModel.policy),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var _pdfController = PdfController(
                document: PdfDocument.openData(snapshot.data),
              );
              return PdfView(controller: _pdfController);
            } else {
              return DelayedCircularProgressIndicator();
            }
          });
    } else {
      return Text('No html specified');
    }
  }

  @override
  PolicyPresentationRepository getPolicyPresentationRepository(BuildContext context) {
    return policyPresentationRepository(appId: AccessBloc.appId(context));
  }
}
