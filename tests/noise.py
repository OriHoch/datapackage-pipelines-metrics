from datapackage_pipelines.wrapper import ingest, spew
from datapackage_pipelines.utilities.resources import PROP_STREAMING
from itertools import chain


parameters, datapackage, resources = ingest()


def get_resource():
    for i in range(100000):
        yield {"i": i}


datapackage["resources"].append({
    "name": "noise",
    "path": "data/noise.csv",
    PROP_STREAMING: True,
    "schema": {
        "fields": [
            {"name": "i", "type": "number"}
        ]
    }
})


spew(datapackage, chain(resources, [get_resource()]))
