enum Stato {
  daComprare,
  comprato,
  letto,
  recensito;

  static String statoToString(Stato stato) {
    switch (stato) {
      case Stato.daComprare:
        return 'Da comprare';
      case Stato.comprato:
        return 'Comprato';
      case Stato.letto:
        return 'Letto';
      case Stato.recensito:
        return 'Recensito';
    }
  }

  static int statoToInt(Stato stato) {
    switch (stato) {
      case Stato.daComprare:
        return 0;
      case Stato.comprato:
        return 1;
      case Stato.letto:
        return 2;
      case Stato.recensito:
        return 3;
    }
  }
}
