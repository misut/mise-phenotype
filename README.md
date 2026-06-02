# mise-phenotype

`mise-phenotype` installs the `phenotype-cli` binary released from
[`misut/phenotype`](https://github.com/misut/phenotype).

```sh
mise plugins install phenotype https://github.com/misut/mise-phenotype.git
mise install phenotype@0.15.0
mise exec phenotype@0.15.0 -- phenotype-cli --version
```

The plugin lists only phenotype releases that publish `phenotype-cli` archives.
The first installable release is `0.15.0`.
