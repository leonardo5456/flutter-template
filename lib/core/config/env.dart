enum Env { local, dev, test, prod }

Env parseEnv(String value) {
  switch (value.toLowerCase()) {
    case 'dev':
      return Env.dev;
    case 'prod':
      return Env.prod;
    case 'test':
      return Env.test;
    default:
      return Env.local;
  }
}

String envName(Env env) {
  switch (env) {
    case Env.local:
      return 'LOCAL';
    case Env.dev:
      return 'DEV';
    case Env.test:
      return 'TEST';
    case Env.prod:
      return 'PROD';
  }
}
