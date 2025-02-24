extension IterableExtension<T> on Iterable<T?> {
  Iterable<R> compactMap<R>({R? Function(T? element)? mapper}) {
    List<R> results = <R>[];

    forEach((element) {
      R? mapResult;

      if (mapper != null) {
        mapResult = mapper(element);
      } else {
        mapResult = element as R?;
      }

      if (mapResult != null) {
        results.add(mapResult);
      }
    });

    return results;
  }
}
