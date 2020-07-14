import json, streams, os, unittest
import parsetoml






# Need to eventually fix these
const skipFiles = ["qa-array-inline-nested-1000", "qa-table-inline-nested-1000"]

suite "Valid files":

  for (kind, path) in walkDir(currentSourcePath().splitPath.head / "test-data" / "values"):
    let data = path.splitFile()
    if kind == pcFile and data.ext == ".toml" and data.name notin skipFiles:
      test data.name:
        try:
          let data = parsetoml.parseFile(path)
          discard data.toJson()
        except:
          echo getCurrentExceptionMsg()
          fail()