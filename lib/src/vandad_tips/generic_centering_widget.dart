import 'package:flutter/material.dart';

T centered<T>() {
  switch (T) {
    case CrossAxisAlignment:
      return CrossAxisAlignment.center as T;
    case MainAxisAlignment:
      return MainAxisAlignment.center as T;
    case Alignment:
      return Alignment.center as T;
    default:
      throw UnsupportedError('$T is not supported');
  }
}
