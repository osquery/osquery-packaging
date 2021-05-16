# osquery packaging scripts

Use these scripts, alongside built osquery binaries, to put together packages
for distribution to the world.

## Building Windows packages

Here's an example of building the chocolatey package:

```bash
cmake -DOSQUERY_DATA_PATH="C:\Users\Nicholas\Path\To\Osquery\build\package_data" -DCPACK_GENERATOR=NuGet ..
```

Here's an example of building the MSI:

```bash
cmake -DOSQUERY_DATA_PATH="C:\Users\Nicholas\Path\To\Osquery\build\package_data" -DCPACK_GENERATOR=Wix ..
```

**Note** that the casing on the `CPACK_GENERATOR` is important.

## Building macOS packages

// TODO

## Building Linux packages

// TODO