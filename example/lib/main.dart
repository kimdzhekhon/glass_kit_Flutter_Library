import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlassKit Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const GlassExampleScreen(),
    );
  }
}

class GlassExampleScreen extends StatelessWidget {
  const GlassExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. 푸른색 계열의 배경 그라데이션
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          // 배경 화려한 구형 객체들
          Positioned(
            top: 50,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.cyanAccent.withOpacity(0.7),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.4),
                    blurRadius: 100,
                    spreadRadius: 20,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.6),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.4),
                    blurRadius: 120,
                    spreadRadius: 30,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: 50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withOpacity(0.4),
                    blurRadius: 80,
                    spreadRadius: 10,
                  )
                ],
              ),
            ),
          ),
          
          // 2. GlassKit 적용 예제 (오버플로우 방지 및 명칭 변경)
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 큼직한 첫 번째 글래스 카드 (기본 효과)
                  GlassKit(
                    borderRadius: 30.0,
                    child: Container(
                      width: double.infinity,
                      // 고정 높이 제거, 패딩으로 감싸 오버플로우 방지
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, // 내용물 크기에 맞춤
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(Icons.water, color: Colors.white, size: 32),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Text(
                                  "표준 GlassKit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            "은은한 깊이감",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "기본 설정(blur: 10)만으로도 훌륭한 반사율을 자랑합니다.",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // 두 번째 글래스 카드 (심화 효과 - 블러 극대화)
                  GlassKit(
                    blur: 35.0,
                    opacity: 0.05,
                    borderRadius: 40.0,
                    borderWidth: 1.5,
                    child: Container(
                      width: double.infinity,
                      // 고정 높이 제거
                      padding: const EdgeInsets.all(40),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min, // 내용물 크기에 맞춤
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.blur_on, color: Colors.white, size: 80),
                          SizedBox(height: 24),
                          Text(
                            "투명도 극대화 설정",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "blur: 35.0  |  opacity: 0.05",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            "투명도를 낮추고 블러를 극강으로 올려\n배경 요소들의 색상 파동만 유리에 번지도록 연출했습니다.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
