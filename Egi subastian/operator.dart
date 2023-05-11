// Author : Egi subastian dan fabiyan air langga

import 'dart:io';

void main() {
  stdout.write("Masukkan Nilai A : ");
  double? num1 = double.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Nilai B : ");
  double? num2 = double.parse(stdin.readLineSync()!);

  double? hasilTambah = tambah(num1, num2);
  stdout.write("Hasil Penjumlahan : $hasilTambah\n");

  double? hasilKurang = kurang(num1, num2);
  stdout.write("Hasil Pengurangan : $hasilKurang\n");

  double? hasilKali = kali(num1, num2);
  stdout.write("Hasil Perkalian : $hasilKali\n");

  double? hasilBagi = bagi(num1, num2);
  stdout.write("Hasil Pembagian : $hasilBagi\n");
}

double tambah(double num1, double num2){
  return num1 + num2;
}

double kurang(double num1, double num2) {
  return num1 - num2;
}

double kali(double num1, double num2) {
  return num1 * num2;
}

double bagi(double num1, double num2) {
  return num1 / num2;
}