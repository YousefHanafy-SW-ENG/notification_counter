import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_text.dart';
import '../providers/notification_notifier.dart';

class NotificationBadge extends ConsumerStatefulWidget {
  const NotificationBadge({
    super.key,
    this.introDuration = const Duration(milliseconds: 1000),
    this.swingDuration = const Duration(milliseconds: 2000),
    this.perspective = 0.0,
    this.introStartAngle = 0.0,
    this.introEndAngle = 0.0,
    this.introScaleBegin = 0.0,
    this.introScaleEnd = 1.0,
    this.autoChain = true,
  });

  /// timing
  final Duration introDuration;
  final Duration swingDuration;

  /// look/feel
  final double perspective;
  final double introStartAngle;
  final double introEndAngle;
  final double introScaleBegin;
  final double introScaleEnd;     

  /// behavior
  final bool autoChain;

  @override
  ConsumerState<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends ConsumerState<NotificationBadge>
    with TickerProviderStateMixin {

  // -------- Controllers --------
  late final AnimationController _introCtrl;
  late final AnimationController _swingCtrl;

  // -------- Intro animations --------
  late final Animation<double> _fadeIntro;
  late final Animation<double> _scaleIntro;
  late final Animation<double> _rotYIntro;
  late final Animation<double> _txIntro;    // subtle right→left x-shift (accentuates flip)

  late final Animation<double> _swingAngle;

  bool _started = false;

  @override
  void initState() {
    super.initState();

    _introCtrl = AnimationController(vsync: this, duration: widget.introDuration);

    _fadeIntro = CurvedAnimation(
      parent: _introCtrl,
      curve: Curves.easeIn,
    );

    _scaleIntro = Tween<double>(
      begin: widget.introScaleBegin,
      end: widget.introScaleEnd,
    ).animate(
      CurvedAnimation(parent: _introCtrl, curve: Curves.easeInQuad),
    );
    _rotYIntro = Tween<double>(
      begin: widget.introStartAngle,
      end: widget.introEndAngle,
    ).animate(
      CurvedAnimation(parent: _introCtrl, curve: Curves.easeOutCubic),
    );

    _txIntro = Tween<double>(begin: 10.0, end: 0.1).animate(
      CurvedAnimation(parent: _introCtrl, curve: Curves.easeOutCubic),
    );
    _swingCtrl = AnimationController(vsync: this, duration: widget.swingDuration);
    _swingAngle = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0,   end: -0.28), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.28, end:  0.23), weight: 1),
      TweenSequenceItem(tween: Tween(begin:  0.23, end: -0.15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.15, end:  0.00), weight: 1),
    ]).animate(
      CurvedAnimation(parent: _swingCtrl, curve: Curves.easeOut),
    );

    _introCtrl.addStatusListener((s) {
      if (s == AnimationStatus.completed && widget.autoChain) {
        _swingCtrl.forward(from: 0.0);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final count = ref.read(notificationProvider).count;
      if (!_started && count > 0 && mounted) {
        _started = true;
        _introCtrl.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    _introCtrl.dispose();
    _swingCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProvider);
    ref.listen(notificationProvider, (prev, next) {
      if (!mounted) return;
      if ((prev?.count ?? 0) != next.count && next.count > 0 && _started) {
        _swingCtrl.forward(from: 0.0);
      }
    });

    if (state.count == 0) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeIntro,
      child: AnimatedBuilder(
        animation: Listenable.merge([_introCtrl, _swingCtrl]),
        builder: (context, child) {
          final introM = Matrix4.identity()
            ..setEntry(0, 2, 0.0022)
            ..rotateY(_rotYIntro.value)
            ..scale(_scaleIntro.value);
          return Transform(
            alignment: Alignment.centerRight,
            transform: introM,
            child: Transform.rotate(
              alignment: Alignment.topCenter,
              angle: _swingAngle.value,
              child: child,
            ),
          );
        },
        child: CustomPaint(
          painter: _BadgePainter(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomText(
                text: '${state.count}',
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BadgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.blackBadgeColor;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 8, size.width, size.height - 10),
      const Radius.circular(6),
    );
    canvas.drawRRect(rrect, paint);

    final path = Path()
      ..moveTo(size.width / 2 - 6, 8)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2 + 6, 8)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
