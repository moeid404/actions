import globals from 'globals';

/** @type {import('eslint').Linter.ConfigArray} */
export default [
  {
    files: ['**/*.js'],
    languageOptions: {
      ecmaVersion: 2021,
      sourceType: 'module',
      globals: globals.node,
    },
    rules: {
      'no-console': 'warn', // Warn on console.log usage
    },
  },
];
