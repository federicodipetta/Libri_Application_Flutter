enum Stato {
  daComprare,
  comprato,
  letto,
  recensito;

  static Stato statoFromInt(int stato) {
    switch (stato) {
      case 0:
        return Stato.daComprare;
      case 1:
        return Stato.comprato;
      case 2:
        return Stato.letto;
      case 3:
        return Stato.recensito;
      default:
        return Stato.daComprare;
    }
  }

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
