# GlassKit (glass_kit 패키지)

Flutter 앱에 **초간편 글래스모피즘(Glassmorphism) 효과**를 추가할 수 있는 라이브러리입니다. `BackdropFilter`, `BoxDecoration`, `ClipRRect`, `Stack` 등을 복잡하게 조합할 필요 없이, 원하는 위젯을 감싸기만 하면 즉시 고급스러운 서리 유리(Frosted Glass) 효과가 적용됩니다.

## 🚀 도입 배경

UI/UX에 민감한 플러터 개발자들을 위해 설계되었습니다. 단 하나의 위젯만 직관적으로 사용하여 최적화된 렌더링 성능으로 유리 질감, 빛 반사 테두리, 배경 흐림 처리를 한 번에 구현합니다.

## 📦 설치

`pubspec.yaml` 파일에 다음을 추가해 주세요:

```yaml
dependencies:
  glass_kit:
    git:
      url: https://github.com/kimdzhekhon/glass_kit.git
```

## 🛠 사용 방법 (Usage)

### 1. 기본 적용 (단 한 단계)

원하는 위젯을 `GlassKit`으로 감싸주기만 하면 끝납니다. 내부적으로 흐림 효과(Blur), 투명도, 테두리 반사 효과가 자동 계산되어 적용됩니다.
```dart
import 'package:glass_kit/glass_kit.dart';

// 기존 위젯
// Text("Hello Glass 유리 효과")

// GlassKit 적용 후
GlassKit(
  child: Padding(
    padding: EdgeInsets.all(32.0),
    child: Text(
      "Hello Glass 유리 효과",
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  ),
)
```

### 2. 커스터마이징 (옵션)

각 속성을 입맛에 맞게 커스텀할 수 있습니다.
```dart
GlassKit(
  blur: 20.0,              // 흐림 효과 강도 (기본: 10.0)
  opacity: 0.15,           // 유리 투명도 (기본: 0.2)
  color: Colors.white,     // 유리의 베이스 색상
  borderRadius: 30.0,      // 모서리 둥글기 (기본: 20.0)
  borderWidth: 1.5,        // 빛 반사 테두리 두께 (기본: 1.0)
  child: Container(
    width: 200,
    height: 200,
    alignment: Alignment.center,
    child: Text("커스텀 GlassKit"),
  ),
)
```

## ⚙️ 내부 처리 프로세스 (Tech Stack)

사용자에게는 단일 위젯(`GlassKit`)으로 감춰져 있지만, 내부적으로는 플러터 엔진 기능을 최적으로 조합합니다:
* **흐림 효과 (Blur)**: `BackdropFilter`와 `ImageFilter`를 `ClipRRect` 안에 배치하여 정확한 렌더 트리 범위만 블러 처리.
* **유리 질감 (Texture)**: 투명도가 적용된 `LinearGradient` 레이어를 사용하여 대각선 빛 반사가 일어나는 유리의 입체적인 질감 구현.
* **빛 반사 테두리 (Border)**: `BoxDecoration`의 `Border.all`을 투명한 흰색(`Colors.white.withOpacity(0.3)`)과 조합하여, 깎인듯한 모서리에 맺히는 빛 반사 시각화.
