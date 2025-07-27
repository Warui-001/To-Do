import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'edit_task_widget.dart' show EditTaskWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTaskModel extends FlutterFlowModel<EditTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for priorityChoiceChips widget.
  FormFieldController<List<String>>? priorityChoiceChipsValueController;
  String? get priorityChoiceChipsValue =>
      priorityChoiceChipsValueController?.value?.firstOrNull;
  set priorityChoiceChipsValue(String? val) =>
      priorityChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for statusChoiceChips widget.
  FormFieldController<List<String>>? statusChoiceChipsValueController;
  String? get statusChoiceChipsValue =>
      statusChoiceChipsValueController?.value?.firstOrNull;
  set statusChoiceChipsValue(String? val) =>
      statusChoiceChipsValueController?.value = val != null ? [val] : [];
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
