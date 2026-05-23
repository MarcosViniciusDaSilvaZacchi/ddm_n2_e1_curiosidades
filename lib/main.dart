import 'package:flutter/material.dart';
// REQUISITO E1: Integração de pacote externo do pub.dev (http)
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // REQUISITO E1: Estruturação de interface (Adição de ícones e textos para não deixar a tela vazia)
            const Icon(Icons.apps, size: 80, color: Colors.blue),
            const SizedBox(height: 24),
            const Text(
              'Bem-vindo ao App da E1!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // NAVEGAÇÃO PARA PÁGINA 1
            ElevatedButton.icon(
              onPressed: () {
                // REQUISITO E1: Implementação de navegação utilizando Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaginaUm()),
                );
              },
              icon: const Icon(Icons.pets),
              label: const Text('Ir para Página 1 (API)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),

            const SizedBox(height: 16),

            // NAVEGAÇÃO PARA PÁGINA 2
            ElevatedButton.icon(
              onPressed: () {
                // REQUISITO E1: Implementação de navegação utilizando Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaginaDois()),
                );
              },
              icon: const Icon(Icons.info),
              label: const Text('Ir para Página 2 (Sobre)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PÁGINA 1: INTEGRAÇÃO COM PACOTE HTTP
// ─────────────────────────────────────────────
// REQUISITO E1: Criação de nova página funcional (Transformada em StatefulWidget para gerenciar o carregamento da API)
class PaginaUm extends StatefulWidget {
  const PaginaUm({super.key});

  @override
  State<PaginaUm> createState() => _PaginaUmState();
}

class _PaginaUmState extends State<PaginaUm> {
  String _fatoGato = "Clique no botão para buscar uma curiosidade!";
  bool _carregando = false;

  // REQUISITO E1: Uso funcional do pacote http escolhido no pub.dev
  Future<void> _buscarCuriosidade() async {
    setState(() {
      _carregando = true;
    });

    try {
      // Fazendo a requisição na API externa
      final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

      if (response.statusCode == 200) {
        // Decodificando o JSON retornado pela API
        final data = json.decode(response.body);
        setState(() {
          _fatoGato = data['fact'];
        });
      } else {
        setState(() {
          _fatoGato = "Erro ao buscar a curiosidade. Tente novamente.";
        });
      }
    } catch (e) {
      setState(() {
        _fatoGato = "Erro de conexão.";
      });
    } finally {
      setState(() {
        _carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1 - Curiosidades'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // REQUISITO E1: Estruturação de Telas com elementos visuais (Imagens da internet e bordas arredondadas)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Área de exibição da API com Card estruturado
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _carregando
                    ? const Center(child: CircularProgressIndicator())
                    : Text(
                        _fatoGato,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
            const SizedBox(height: 24),

            // REQUISITO E1: Interação com o usuário para acionar a API
            ElevatedButton(
              onPressed: _buscarCuriosidade,
              child: const Text('Buscar Nova Curiosidade'),
            ),
            const Spacer(),

            // REQUISITO E1: Implementação de navegação de retorno utilizando Navigator.pop
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PÁGINA 2: ESTRUTURAÇÃO DE UI
// ─────────────────────────────────────────────
// REQUISITO E1: Criação da segunda página obrigatória com layout organizado
class PaginaDois extends StatelessWidget {
  const PaginaDois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2 - Sobre'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // REQUISITO E1: Elementos visuais não vazios (Avatar e Textos centralizados)
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text(
              'Desenvolvido para N2 - E1',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Esta página demonstra a capacidade de estruturar layouts no Flutter contendo imagens, textos e botões, cumprindo os requisitos de UI.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            // REQUISITO E1: Retornar à tela anterior (Navigator.pop)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home),
                label: const Text(
                  'Retornar à Página Inicial',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
