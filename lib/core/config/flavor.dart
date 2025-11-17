enum Flavor { local, dev, test, prod }


String flavorName(Flavor flavor) {
  switch (flavor) {
    case Flavor.local:
      return 'LOCAL';
    case Flavor.dev:
      return 'DEV';
    case Flavor.test:
      return 'TEST';
    case Flavor.prod:
      return 'PROD';
  }
}
