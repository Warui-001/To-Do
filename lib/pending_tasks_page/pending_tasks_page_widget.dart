import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/list_tasks_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pending_tasks_page_model.dart';
export 'pending_tasks_page_model.dart';

class PendingTasksPageWidget extends StatefulWidget {
  const PendingTasksPageWidget({super.key});

  static String routeName = 'PendingTasksPage';
  static String routePath = '/pendingTasksPage';

  @override
  State<PendingTasksPageWidget> createState() => _PendingTasksPageWidgetState();
}

class _PendingTasksPageWidgetState extends State<PendingTasksPageWidget> {
  late PendingTasksPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PendingTasksPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        floatingActionButton: Align(
          alignment: AlignmentDirectional(1.0, 1.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              context.pushNamed(CreateTaskWidget.routeName);
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 30.0,
                ),
                Text(
                  'Add Task',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).error,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Text(
                      'Pending Tasks',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF161C24),
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<List<TasksRecord>>(
                    stream: queryTasksRecord(
                      queryBuilder: (tasksRecord) => tasksRecord
                          .where(
                            'userRef',
                            isEqualTo: currentUserReference,
                          )
                          .where(
                            'status',
                            isEqualTo: 'Pending',
                          )
                          .orderBy('priority', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<TasksRecord> listViewTasksRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTasksRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewTasksRecord =
                              listViewTasksRecordList[listViewIndex];
                          return ListTasksWidget(
                            key: Key(
                                'Keymha_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                            title: listViewTasksRecord.title,
                            description: listViewTasksRecord.description,
                            status: listViewTasksRecord.status,
                            priority: listViewTasksRecord.priority,
                            document: listViewTasksRecord,
                            dateCreated: listViewTasksRecord.createdDate,
                            dueDate: listViewTasksRecord.dueDate,
                            editTask: () async {
                              context.pushNamed(
                                EditTaskWidget.routeName,
                                queryParameters: {
                                  'taskDocument': serializeParam(
                                    listViewTasksRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'taskDocument': listViewTasksRecord,
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
