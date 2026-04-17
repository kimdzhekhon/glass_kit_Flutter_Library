<div align="center">

# 🪟 GlassKit — Flutter Frosted Glass Library

**단 하나의 위젯으로 구현하는 Frosted Glass 효과** — Flutter 미니멀 유리 효과 패키지

[![Pub.dev](https://img.shields.io/badge/pub.dev-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://pub.dev)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

![Version](https://img.shields.io/badge/version-0.0.1-blue?style=flat-square)
![Flutter](https://img.shields.io/badge/Flutter-%3E%3D1.17.0-blue?style=flat-square)

</div>

---

## 🌟 개요

`BackdropFilter`, `Stack`, `ClipRRect`의 복잡한 조합을 추상화하여, 단 하나의 위젯으로 현대적인 Frosted Glass(반투명 유리) UI 효과를 구현하는 Flutter 패키지입니다.

## 🛠 기술 스택

| 영역 | 기술 |
|------|------|
| **언어** | Dart 3.11 |
| **프레임워크** | Flutter ≥1.17.0 |
| **의존성** | 외부 패키지 없음 (순수 Flutter SDK) |

## 📦 설치

```yaml
dependencies:
  glass_kit: ^0.0.1
```

## 🔍 핵심 기술 상세

### 구현 원리
Flutter의 `ImageFilter.blur`를 `BackdropFilter`로 적용하여 배경을 블러 처리합니다. 내부적으로 `Stack + ClipRRect + BackdropFilter + Container`를 조합하지만, 사용자는 단일 위젯만 사용합니다.

```dart
GlassContainer(
  height: 200,
  width: 300,
  blur: 10,
  color: Colors.white.withOpacity(0.1),
  borderRadius: BorderRadius.circular(16),
  child: YourContent(),
)
```

### 렌더링 성능
BackdropFilter는 GPU 집약적 연산입니다. GlassKit은 필요한 경우에만 blur 레이어를 활성화하도록 설계되어 불필요한 렌더링 오버헤드를 방지합니다.