import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginHistoryScreen extends StatelessWidget {
  const LoginHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Historial de Inicios de Sesión')),
        body: const Center(child: Text('No hay usuario autenticado.')),
      );
    }
    final String userId = user.uid;

    final stream = FirebaseFirestore.instance
        .collection('login_history')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Inicios de Sesión'),
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error al leer historial: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];

          // Debug: imprime cuántos docs llegaron
          // (abre la consola con flutter run para ver esto)
          // debugPrint('login_history docs count: ${docs.length}');

          if (docs.isEmpty) {
            return const Center(
              child: Text('No hay registros de inicio de sesión.'),
            );
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final entry = doc.data() as Map<String, dynamic>? ?? {};
              final Timestamp? ts = (entry['timestamp'] is Timestamp) ? entry['timestamp'] as Timestamp : null;
              final DateTime? timestamp = ts?.toDate();
              final formattedDate = timestamp != null
                  ? '${timestamp.day}/${timestamp.month}/${timestamp.year} - ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}'
                  : 'Fecha desconocida';
              String device = entry['device']?.toString() ?? 'Desconocido';
              if (device.toLowerCase().contains('android')) device = 'Android';
              else if (device.toLowerCase().contains('ios')) device = 'iOS';
              else if (device.toLowerCase().contains('web')) device = 'Web';

              final email = entry['email']?.toString() ?? '—';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.history, color: Colors.indigo),
                  title: Text(email),
                  subtitle: Text('Fecha: $formattedDate\nDispositivo: $device'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}