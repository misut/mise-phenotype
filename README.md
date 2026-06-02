# mise-phenotype

`mise-phenotype` installs the `phenotype` binary released from
[`misut/phenotype`](https://github.com/misut/phenotype).

```sh
mise plugins install phenotype https://github.com/misut/mise-phenotype.git
mise install phenotype@0.16.0
mise exec phenotype@0.16.0 -- phenotype --version
```

The plugin lists only phenotype releases that publish CLI binary archives.
The `phenotype` binary name is available from `0.16.0`.
