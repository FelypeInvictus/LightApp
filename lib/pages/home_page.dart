import 'package:flashman/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:torch_light/torch_light.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: Text(
          widget.title,
          style: GoogleFonts.acme(),
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                SystemNavigator.pop();
              },
              child: const Icon(
                Icons.exit_to_app,
                
              ),
            ),
          ),
        ],
      ),
      
      drawer: AlertDialog(
        elevation: 4,
        alignment: Alignment.center,
        content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            textCustom("App criado por Felype Rangel."),
            textCustom("Todos os créditos reservados."),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Fechar", style: TextStyle(color: Colors.amber, fontSize: 25),),),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(136, 110, 109, 109),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              isLight ? Icons.light : Icons.light_outlined,
              size: 150,
              color: Colors.white,
            ),
            Text(
              isLight ? "Lanterna ligada" : "Lanterna desligada",
              style: TextStyle(color: Colors.white, fontSize: 18),
              //style: Theme.of(context).textTheme.headlineMedium,
            ),
            Switch(
              value: isLight,
              onChanged: (bool value) async {
                isLight = value;

                try {
                  isLight
                      ? await TorchLight.enableTorch()
                      : TorchLight.disableTorch();
                } on Exception catch (_) {
                  // Handle error
                }

                setState(() {});
              },
              activeColor: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}