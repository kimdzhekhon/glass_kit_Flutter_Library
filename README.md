<div align="center">

<img src="https://raw.githubusercontent.com/kimdzhekhon/glass_kit_Flutter_Library/main/assets/icon.png" width="100" alt="GlassKit Logo" onerror="this.style.display='none'"/>

# glass_kit Flutter Library

단일 위젯으로 구현하는 Flutter 프로스티드 글래스 효과 라이브러리

![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![pub.dev](https://img.shields.io/badge/pub.dev-0.0.1-blue?style=for-the-badge)

![Flutter](https://img.shields.io/badge/Flutter-%E2%89%A51.17.0-54C5F8?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3-0175C2?style=flat-square&logo=dart)
![Dependencies](https://img.shields.io/badge/dependencies-zero-brightgreen?style=flat-square)

[시작하기](#설치-및-실행) · [사용법](#데이터-흐름--사용법) · [기여하기](https://github.com/kimdzhekhon/glass_kit_Flutter_Library/issues)

</div>

---

## 목차

1. [소개](#소개)
2. [주요 기능](#주요-기능)
3. [기술 스택](#기술-스택)
4. [아키텍처](#아키텍처)
5. [데이터 흐름 / 사용법](#데이터-흐름--사용법)
6. [설치 및 실행](#설치-및-실행)
7. [빌드 & 배포](#빌드--배포)
8. [Roadmap](#roadmap)
9. [라이선스](#라이선스)

---

## 소개

glass_kit은 Flutter에서 프로스티드 글래스(Frosted Glass) UI 효과를 단일 위젯 API로 제공하는 경량 라이브러리입니다. `BackdropFilter`와 `ImageFilter.blur`, `ClipRRect`를 내부적으로 추상화하여 블러 강도, 불투명도, 테두리 반경 등을 간단히 설정할 수 있습니다. 이미지, 그라디언트, 영상 등 어떤 배경 위에서도 동작하며, GPU 효율을 고려해 블러 레이어를 필요할 때만 적용합니다.

> **"복잡한 BackdropFilter 코드 없이, GlassContainer 하나로 완성되는 글래스 UI."**

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 주요 기능

| 기능 | 설명 |
|------|------|
| GlassContainer 위젯 | 프로스티드 글래스 효과를 적용하는 단일 위젯 |
| 블러 강도 커스텀 | `blur` 파라미터로 0~∞ 강도 자유 조정 |
| 불투명도 조절 | `color`의 opacity로 투명도 세밀 제어 |
| 테두리 반경 | `borderRadius`로 모서리 곡률 설정 |
| GPU 효율 렌더링 | 블러 레이어를 필요할 때만 적용하여 성능 최적화 |
| 범용 배경 호환 | 이미지, 그라디언트, 영상 등 모든 배경에서 동작 |
| 무의존성 | 외부 패키지 의존성 없음 |

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 기술 스택

| 레이어 | 기술 | 역할 |
|--------|------|------|
| 블러 효과 | Flutter BackdropFilter | 배경에 블러 필터 적용 |
| 이미지 처리 | dart:ui ImageFilter.blur | 가우시안 블러 파라미터 제어 |
| 클리핑 | ClipRRect | 테두리 반경 적용 |
| 언어 | Dart 3 | 위젯 및 API 구현 |
| 패키지 배포 | pub.dev | 라이브러리 배포 및 버전 관리 |
| 최소 SDK | Flutter ≥ 1.17.0 | 광범위한 호환성 보장 |

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 아키텍처

```
glass_kit_Flutter_Library/
├── lib/
│   ├── glass_kit.dart              # 패키지 진입점 (export)
│   └── src/
│       ├── glass_container.dart    # GlassContainer 위젯 (공개 API)
│       └── glass_painter.dart      # 내부 블러/클리핑 렌더러
├── example/                        # 사용 예제 앱
└── pubspec.yaml
```

**핵심 패턴**
- `GlassContainer`는 `Stack` 위에 `BackdropFilter` + `ClipRRect`를 레이어링하여 효과 구현
- `sigmaX / sigmaY`를 `blur` 단일 파라미터로 추상화하여 API 단순화
- `shouldRebuildSemantics`를 최소화하여 접근성 트리 오버헤드 방지

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 데이터 흐름 / 사용법

```
GlassContainer 파라미터 입력 → ClipRRect 적용 → BackdropFilter(blur) → 배경 블러 합성 → 화면 표시
  blur: 10, opacity: 0.1    →   borderRadius   →  ImageFilter.blur  →   frosted glass  →    UI
```

```dart
import 'package:glass_kit/glass_kit.dart';

GlassContainer(
  height: 200,
  width: 300,
  blur: 10,
  color: Colors.white.withOpacity(0.1),
  borderRadius: BorderRadius.circular(16),
  child: YourContent(),
)
```

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 설치 및 실행

**요구 사항**
- Flutter ≥ 1.17.0
- Dart 3

```yaml
# pubspec.yaml
dependencies:
  glass_kit: ^0.0.1
```

```bash
flutter pub get
```

```dart
import 'package:glass_kit/glass_kit.dart';
```

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 빌드 & 배포

```bash
# 패키지 유효성 검사
dart pub publish --dry-run

# pub.dev 배포
dart pub publish
```

pub.dev 배포 전 `pubspec.yaml`의 `version` 필드와 `CHANGELOG.md`를 업데이트하십시오.

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## Roadmap

- [x] GlassContainer 위젯 구현
- [x] BackdropFilter 추상화
- [x] 블러 강도 커스텀 파라미터
- [ ] pub.dev 정식 배포
- [ ] GlassList / GlassCard 추가 위젯
- [ ] 애니메이션 블러 전환 지원
- [ ] 성능 벤치마크 문서화

<div align="right"><a href="#목차">↑ 맨 위로</a></div>

---

## 라이선스

MIT License — Copyright © 2024-2026 kimdzhekhon

이 소프트웨어는 MIT 라이선스 하에 자유롭게 사용, 복사, 수정, 배포할 수 있습니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하십시오.

<div align="right"><a href="#목차">↑ 맨 위로</a></div>
