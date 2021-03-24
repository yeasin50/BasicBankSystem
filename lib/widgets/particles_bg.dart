import 'dart:async';
import 'dart:math';

import 'package:bank_app_social/configs/size.dart';
import 'package:bank_app_social/models/particle.dart';
import 'package:flutter/material.dart';

import 'neon_container.dart';

class ParticlesBackground extends StatefulWidget {
  @override
  _ParticlesBackgroundState createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground> {
  var width, height;
  // var colors = [
  //   Colors.white,
  //   Colors.yellow,
  //   Colors.black,
  //   Colors.blue,
  //   Colors.black,
  //   Colors.yellow,
  // ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      SizeConfig().init(context);
      width = SizeConfig.screenWidth!;
      height = SizeConfig.screenHeight!;

      Random random = new Random();
      Particle particle = new Particle(pos: Pvector(width / 2, height / 2));
      particles.add(particle);
      List.generate(numberOfParticles, (index) {
        var x = random.nextDouble() * width * .9;

        /// .9 will handle the out boundary
        var y = random.nextDouble() * height * .9;
        if (x < particle.radius) x += particle.radius * 2;
        if (y < particle.radius) y += particle.radius * 2;

        var pos = Pvector(x, y);
        var pt = Particle(pos: pos);

        ///dynamic color
        pt.colors = ColorList[index % (ColorList.length)];

        //init dynamic vector poss 4diff direction
        if (numberOfParticles % 4 == 0) pt.velocity.x = -pt.velocity.x;
        if (numberOfParticles % 4 == 1) pt.velocity.y = -pt.velocity.y;
        if (numberOfParticles % 4 == 2) {
          pt.velocity.x = -pt.velocity.x;
          pt.velocity.y = -pt.velocity.y;
        }

        /// litte dynamic velocity
        if (index % 3 == 0) pt.velocity.y *= 1.2;
        if (index % 3 == 1) pt.velocity.x *= .8;
        if (index % 3 == 2) {
          pt.velocity.x *= .8;
          pt.velocity.y *= .9;
        }

        particles.add(pt);
      });

      timer = Timer.periodic(
        Duration(milliseconds: (fps * 1000).floor()),
        // Duration(milliseconds: 100),
        frameBuilder,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    particles.clear();
    super.dispose();
  }

  late Timer timer;
  final Random random = Random();
  final double fps = 1 / 24;

  frameBuilder(Timer timer) {
    particles.forEach((pt) {
      pt.pos.y += pt.velocity.y;
      pt.pos.x += pt.velocity.x;

      boxCollision(pt);
    });
    if (particles.isNotEmpty) {
      setState(() {});
    }
  }

  void boxCollision(Particle pt) {
    if (pt.pos.y > height - pt.radius * 2 || pt.pos.y <= 0) {
      pt.velocity.y = -pt.velocity.y;
    }
    if (pt.pos.x > width - pt.radius || pt.pos.x <= 0) {
      pt.velocity.x = -pt.velocity.x;
    }

    // if (pt.pos.y > height - pt.radius) {
    //   pt.pos.y = height - pt.radius;
    //   pt.velocity.y *= pt.jumpFactor;
    // }
  }

  List<Particle> particles = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    width = SizeConfig.screenWidth!;
    height = SizeConfig.screenHeight!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Positioned(
          //   child: Container(
          //     width: width,
          //     height: height,
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //       color: Colors.red,
          //     )),
          //   ),
          // ),
          ...particles
              .map((p) => Positioned(
                    top: p.pos.y,
                    left: p.pos.x,
                    child: BubbleRadialContainer(
                      radius: p.radius,
                      colors: p.colors,
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
