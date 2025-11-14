enum Flavor { local, dev, prod }

String flavorName(Flavor flavor) {
  switch (flavor) {
    case Flavor.local:
      return 'LOCAL';
    case Flavor.dev:
      return 'DEV';
    case Flavor.prod:
      return 'PROD';
  }
}
