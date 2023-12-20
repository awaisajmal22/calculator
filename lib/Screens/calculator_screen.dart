import 'package:calculator/Provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Consumer<CalculatorProvider>(
        builder: (context, provider, child) {
          return SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.5, 1),
                        blurStyle: BlurStyle.outer,
                        color: Colors.deepOrange,
                        spreadRadius: 0.5,
                        blurRadius: 20,
                      ),
                      BoxShadow(
                        offset: Offset(1, 0.2),
                        blurStyle: BlurStyle.outer,
                        color: Colors.yellow,
                        spreadRadius: 0.4,
                        blurRadius: 20,
                      ),
                    ]),
                height: size.height * 0.2,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.08,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: <Color>[
                                Colors.yellow,
                                Colors.deepOrange.shade900
                              ],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: Text(
                            provider.userInput,
                            style: GoogleFonts.akayaKanadaka(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: <Color>[
                                Colors.yellow,
                                Colors.deepOrange.shade900
                              ],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: Text(
                            provider.answer,
                            style: GoogleFonts.akayaKanadaka(fontSize: 60),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                  ),
                  children: List.generate(
                      provider.numberList.length,
                      (index) => GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                provider.clearData(input: '', ans: '0');
                              } else if (index == 1) {
                                provider.deletData();
                              } else if (index == 2) {
                              } else if (index == 19) {
                                provider.equalData(input: provider.userInput);
                              } else {
                                provider.percentData(
                                    input: provider.numberList[index].val);
                              }
                            },
                            child: Container(
                              height: size.height * 0.1,
                              // decoration:
                              // const BoxDecoration(color: Colors.red),
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                      colors: <Color>[
                                        Colors.yellow,
                                        Colors.deepOrange.shade900
                                      ],
                                      tileMode: TileMode.mirror,
                                    ).createShader(bounds);
                                  },
                                  child: Text(
                                    provider.numberList[index].val.toString(),
                                    style: GoogleFonts.adamina(fontSize: 40),
                                  ),
                                ),
                              ),
                            ),
                          )).toList(),
                ),
              )
            ],
          ));
        },
      ),
    );
  }
}
