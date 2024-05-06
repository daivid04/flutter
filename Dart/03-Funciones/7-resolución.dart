import 'dart:io';

void main() {
  List<Map> userData = [];
  setUserInfo(userData);
  mostrar(userData);
}

String pedirDato(String dato) {
  return pedir(dato, () => stdin.readLineSync()!);
}

String pedir(String dato, Function x) {
  stdout.write('$dato: ');
  return x();
}

void setUserInfo(List<Map> userData) {
  int cant = int.tryParse(pedirDato('Cantidad')) ?? 0;
  for (int i = 0; i < cant; i++) {
    stdout.writeln('<----------Usuario ${i + 1}---------->');
    Map<String, dynamic> usuario = {};
    usuario['Nombre'] = pedirDato('Nombre');
    usuario['Edad'] = pedirDato('Edad');
    usuario['Pais'] = pedirDato('Pais');
    AddSalario(usuario);
    userData.add(usuario);
  }
}

void AddSalario(Map usuario) {
  double sueldo = double.tryParse(pedirDato('Salario')) ?? 0;
  usuario['Sueldo'] = sueldo;
  usuario['Deducciones'] = deducciones(sueldo);
  usuario['Salario Neto'] = salarioNeto(sueldo);
}

double deducciones(double salario) => salario * 0.15;
double salarioNeto(double salario) => salario - deducciones(salario);

void mostrar(List userData) {
  for (int i = 0; i < userData.length; i++) {
    print('Usuario ${i + 1} \n ${userData[i]}');
  }
}
