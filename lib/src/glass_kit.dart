import 'dart:ui';
import 'package:flutter/material.dart';

/// 초간편 글래스모피즘 위젯.
///
/// 사용자는 단순히 이 위젯으로 대상 위젯을 감싸기만 하면 됩니다.
/// 배경을 흐리게(블러) 처리하고, 반투명한 질감 및 빛 반사 테두리를 추가하여 
/// 고급스러운 서리 유리 효과를 제공합니다.
class GlassKit extends StatelessWidget {
  /// 유리 효과 내부에 배치할 자식 위젯
  final Widget child;

  /// 흐림 효과 강도 (기본값: 10.0)
  final double blur;

  /// 투명도 (기본값: 0.2)
  final double opacity;

  /// 유리의 기본 색상 (기본값: Colors.white)
  final Color color;

  /// 모서리의 둥근 정도 (기본값: 20.0)
  final double borderRadius;

  /// 외부 빛 반사 테두리 두께. 0이면 테두리가 없습니다. (기본값: 1.0)
  final double borderWidth;

  const GlassKit({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.2,
    this.color = Colors.white,
    this.borderRadius = 20.0,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        // 자식 위젯 크기만큼 Stack이 크기를 갖도록 합니다.
        children: [
          // 1. 흐림 효과 (Blur Layer)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: const SizedBox.expand(),
            ),
          ),
          
          // 2. 유리 질감 및 그라데이션 빛 반사 처리 (Overlay & Border)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              // 하얀색 반투명 테두리로 유리 가장자리의 빛 반사를 모방합니다.
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: borderWidth,
              ),
              // 빛이 사선으로 반사되는 그라데이션 질감을 추가하여 입체감을 줍니다.
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(opacity + 0.1),
                  color.withOpacity(opacity - 0.1 > 0 ? opacity - 0.1 : 0.05),
                ],
              ),
            ),
            // 최종적으로 사용자가 전달한 자식 위젯을 그립니다.
            child: child,
          ),
        ],
      ),
    );
  }
}
