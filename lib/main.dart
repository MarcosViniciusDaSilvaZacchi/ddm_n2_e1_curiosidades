import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Curiosidades',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Rota inicial definida pelo código base
      home: const HomePage(), 
    );
  }
}

// ==========================================
// TELA BASE (HomePage)
// ==========================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Inicial', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lightbulb_outline, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 24),
            const Text(
              'Bem-vindo ao App de Curiosidades!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // NAVEGAÇÃO 1: Ir para a tela com o pacote do pub.dev
            ElevatedButton.icon(
              icon: const Icon(Icons.view_carousel),
              label: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Ver Curiosidades Tech', style: TextStyle(fontSize: 16)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CuriosidadesPage()),
                );
              },
            ),

            const SizedBox(height: 16),

            // NAVEGAÇÃO 2: Ir para a tela de informações
            OutlinedButton.icon(
              icon: const Icon(Icons.info_outline),
              label: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Sobre o App', style: TextStyle(fontSize: 16)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SobrePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


// TELA 1 (Uso do pacote carousel_slider)

class CuriosidadesPage extends StatelessWidget {
  const CuriosidadesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de curiosidades para alimentar o pacote visual
    final List<Map<String, String>> curiosidades = [
      {
        "titulo": "O Primeiro Bug",
        "texto": "O termo 'bug' de computador surgiu quando uma mariposa real ficou presa em um relé do computador Harvard Mark II em 1947.",
        "icone": "bug_report"
      },
      {
        "titulo": "Xbox Series X",
        "texto": "O processador do Xbox Series X é tão complexo que possui bilhões de transistores, rivalizando com PCs de altíssimo desempenho.",
        "icone": "gamepad"
      },
      {
        "titulo": "Linguagem Dart",
        "texto": "Criada pelo Google, a linguagem Dart foi projetada inicialmente para substituir o JavaScript, mas encontrou seu verdadeiro lar no Flutter.",
        "icone": "code"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosidades Tech'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Deslize para o lado!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            
            // INTEGRAÇÃO DO PACOTE EXTERNO
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true, // Roda automaticamente
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: curiosidades.map((curiosidade) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4))],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, size: 40, color: Colors.amber),
                            const SizedBox(height: 16),
                            Text(
                              curiosidade["titulo"]!,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              curiosidade["texto"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


// TELA 2 (Navegação de Retorno)

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.developer_mode, size: 60, color: Colors.deepPurple),
            const SizedBox(height: 24),
            const Text(
              'Projeto E1 - Desenvolvimento Mobile',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Este aplicativo foi desenvolvido para demonstrar o domínio sobre rotas de navegação no Flutter, construção estruturada de layouts utilizando Scaffold, e a integração de pacotes de terceiros (pub.dev) no ecossistema Dart.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const Spacer(),
            
            // NAVEGAÇÃO 3: Retornar à tela anterior (Pop)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar ao Menu Inicial'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}