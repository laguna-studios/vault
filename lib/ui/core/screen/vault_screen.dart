import "package:flutter/material.dart";

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text("$index"),
        ),
      ),
      floatingActionButton: Flow(
        delegate: VaultFlowDelegate(animation: _animationController),
        children: [
          FloatingActionButton(onPressed: _toggleFAB, child: Icon(Icons.add)),
          FloatingActionButton(onPressed: null, child: Icon(Icons.photo)),
          FloatingActionButton(onPressed: null, child: Icon(Icons.web)),
        ],
      ),
    );
  }

  void _toggleFAB() {
    _animationController.isCompleted ? _animationController.reverse() : _animationController.forward();
  }
}

class VaultFlowDelegate extends FlowDelegate {
  final Animation animation;

  VaultFlowDelegate({super.repaint, required this.animation});

  @override
  void paintChildren(FlowPaintingContext context) {
    context.paintChild(0, transform: Matrix4.identity());

    for (int i = 1; i < context.childCount; i++) {
      context.paintChild(i, transform: Matrix4.translationValues(animation.value * 50, animation.value * 50, 0));
    }
  }

  @override
  bool shouldRepaint(covariant VaultFlowDelegate oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
