import 'package:bill_board/content_managment/cud_page.dart';
import 'package:flutter/material.dart';
import 'package:bill_board/pages/home_page.dart';
import '../analytic_report/export_report.dart';
import '../analytic_report/login_publish_history.dart';
import '../analytic_report/usage_stats.dart';
import '../content_managment/display_schedule.dart';
import '../content_managment/preview_content.dart';
import '../content_managment/upload_im_vid.dart';
import '../display_settings/config_billboard_screen.dart';
import '../display_settings/display_priorities.dart';
import '../display_settings/manage_layout.dart';
import '../system_monitory/alerts.dart';
import '../system_monitory/billboard_uptime.dart';
import '../system_monitory/status_log.dart';
import '../user_management/approve_block.dart';
import '../user_management/man_lec_stud.dart';
import '../user_management/role_permission.dart';
import '../utilities/login_page.dart';

class AdministratorPage extends StatelessWidget {
  const AdministratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F51B5),
        title: const Text('Administrator Panel', style: TextStyle(color: Color(0xFFFDF6F0))),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFFDF6F0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF3F51B5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.admin_panel_settings, size: 80, color: Color(0xFFFDF6F0)),
                  SizedBox(height: 10),
                  Text('Administrator Menu', style: TextStyle(color: Color(0xFFFDF6F0), fontSize: 20)),
                ],
              ),
            ),
            _buildSectionTitle('Content Management'),
            _buildDrawerItem(context, Icons.add_to_photos, 'Create/Update/Delete Ads', const AnnouncementPage()),
            _buildDrawerItem(context, Icons.upload_file, 'Upload Images & Videos', const UploadContentPage()),
            _buildDrawerItem(context, Icons.schedule, 'Set Display Schedules', const ScheduleManagementPage()),
            _buildDrawerItem(context, Icons.visibility, 'Preview Content', const PreviewContentPage()),

            _buildSectionTitle('User Management'),
            _buildDrawerItem(context, Icons.group_add, 'Manage Lecturer & Student Accounts', const ManageAccountsPage()),
            _buildDrawerItem(context, Icons.security, 'Assign Roles & Permissions', const AssignRolesPage()),
            _buildDrawerItem(context, Icons.block, 'Approve or Block Accounts', const ApproveBlockAccountsPage()),

            _buildSectionTitle('Display Settings'),
            _buildDrawerItem(context, Icons.settings_display, 'Configure Billboard Screens', const ConfigureScreensPage()),
            _buildDrawerItem(context, Icons.priority_high, 'Set Display Priorities', const DisplayPriorityPage()),
            _buildDrawerItem(context, Icons.view_compact, 'Manage Layouts', const ManageLayoutsPage()),

            _buildSectionTitle('System Monitoring'),
            _buildDrawerItem(context, Icons.monitor_heart, 'View System Status & Logs', const SystemStatusPage()),
            _buildDrawerItem(context, Icons.signal_wifi_statusbar_connected_no_internet_4, 'Monitor Billboard Uptime', const MonitorUptimePage()),
            _buildDrawerItem(context, Icons.notifications_active, 'System Alerts', const SystemAlertsPage()),

            _buildSectionTitle('Analytics & Reports'),
            _buildDrawerItem(context, Icons.analytics, 'Usage Statistics', const UsageStatisticsPage()),
            _buildDrawerItem(context, Icons.report, 'Export Reports', const ExportReportsPage()),
            _buildDrawerItem(context, Icons.history, 'Login & Publishing History', const LoginPublishingHistoryPage()),

            const Divider(),
            _buildDrawerItem(context, Icons.logout, 'Logout', const GeneralLoginPage(), isLogout: true),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.admin_panel_settings, size: 100, color: Color(0xFF3F51B5)),
            SizedBox(height: 20),
            Text('Welcome, Administrator', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Use the side menu to manage the electronic billboard system.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget page, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (isLogout) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        }
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)),
    );
  }
}
