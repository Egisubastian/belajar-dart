import 'dart:io';

void main() {
  var cart = <String, int>{};
  var products = {
    'daging'  : 100000,
    'thai tea': 150000,
    'jeruk'   : 80000,
    'wortel'  : 120000,
    'pisang'  : 150000,
  };

  while (true) {
    print('============ Selamat datang di giziku! ============');
    print('1. Tambah barang ke keranjang');
    print('2. Hapus barang dari keranjang');
    print('3. Lihat keranjang');
    print('4. Proses pembayaran');
    print('5. Keluar');
    print('=======================================================');

    stdout.write('Masukkan pilihan: ');
    var choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        addToCart(cart, products);
        break;
      case 2:
        removeFromCart(cart);
        break;
      case 3:
        viewCart(cart, products);
        break;
      case 4:
        processPayment(cart, products);
        break;
      case 5:
        exit(0);
        break;
      default:
        print('Pilihan tidak valid. Silakan coba lagi.\n');
    }
  }
}

void addToCart(Map<String, int> cart, Map<String, int> products) {
  print('\nDaftar produk:');
  products.forEach((product, price) => print('$product - Rp$price'));

  stdout.write('Masukkan nama produk: ');
  var product = stdin.readLineSync();

  if (products.containsKey(product)) {
    stdout.write('Masukkan jumlah: ');
    var quantity = int.tryParse(stdin.readLineSync() ?? '');

    if (quantity != null && quantity > 0) {
      cart.update('$product', (value) => value + quantity,
          ifAbsent: () => quantity);
      print('Produk berhasil ditambahkan ke keranjang.\n');
    } else {
      print('Jumlah tidak valid. Gagal menambahkan produk ke keranjang.\n');
    }
  } else {
    print('Produk tidak valid. Gagal menambahkan produk ke keranjang.\n');
  }
}

void removeFromCart(Map<String, int> cart) {
  if (cart.isEmpty) {
    print('\nKeranjang kosong.\n');
    return;
  }

  print('\nIsi keranjang:');
  cart.forEach((product, quantity) => print('$product - $quantity'));

  stdout.write('Masukkan nama produk yang akan dihapus: ');
  var product = stdin.readLineSync()?.toLowerCase();

  if (cart.containsKey(product)) {
    cart.remove(product);
    print('Produk berhasil dihapus dari keranjang.\n');
  } else {
    print('Produk tidak ditemukan di keranjang.\n');
  }
}

void viewCart(Map<String, int> cart, Map<String, int> products) {
  if (cart.isEmpty) {
    print('\nKeranjang kosong.\n');
    return;
  }

  print('\nIsi keranjang:');
  cart.forEach((product, quantity) {
    var price = products[product]!;
    var total = price * quantity;
    print('$product - $quantity x Rp$price = Rp$total');
  });
  print('Total: Rp${calculateTotal(cart, products)}\n');
}

int calculateTotal(Map<String, int> cart, Map<String, int> products) {
  var total = 0;
  cart.forEach((product, quantity) {
    var price = products[product]!;
    total += price * quantity;
  });
  return total;
}

void processPayment(Map<String, int> cart, Map<String, int> products) {
  if (cart.isEmpty) {
    print('\nKeranjang kosong. Tidak ada pembayaran yang perlu diproses.\n');
    return;
  }

  viewCart(cart, products);

  print('Proses pembayaran...');
  print('Masukkan jumlah uang yang diberikan oleh pelanggan: ');

  var payment = int.tryParse(stdin.readLineSync() ?? '');

  if (payment != null && payment >= calculateTotal(cart, products)) {
    var change = payment - calculateTotal(cart, products);
    print('Pembayaran berhasil.');
    print('Kembalian: Rp$change\n');
    cart.clear();
  } else {
    print(' Maaf umlah uang tidak valid atau tidak cukup. Pembayaran gagal.\n');
  }
}