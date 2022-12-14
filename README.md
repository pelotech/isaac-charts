## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

To install the chart:
```bash
# add this repository
helm repo add <repo-alias> https://pelotech.github.io/isaac-charts

# install the chart
helm install <release-name> <repo-alias>/<chart-name>

# uninstall the chart
helm delete <release-name>
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
<repo-alias>` to see the charts.

