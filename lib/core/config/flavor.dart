enum Flavor { config1, config2, config3 }

// you can add more configurations if needed for different flavors

String flavorName(Flavor flavor) {
  switch (flavor) {
    case Flavor.config1:
      return 'CONFIG 1';
    case Flavor.config2:
      return 'CONFIG 2';
    case Flavor.config3:
      return 'CONFIG 3';
  }
}
