// ignore_for_file: unused_local_variable
void main() {
  List<String> Dbz = ['Goku', 'Vegeta', 'Gohan', 'Gotenks'];
  print('Los dioses del anime');
  for (String heroes in Dbz) {
    //Es un ciclo for para listas y set
    print('- $heroes');
  }
  Set<String> Naruto = {'Naruto', 'Sasuke', 'Sakura'};
  print('\nLos noobs de konoha');
  for (String Noobs in Naruto) {
    print('- $Noobs');
  }
}
