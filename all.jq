
def json2aggrid:
    . as $rowData 
    | $rowData[0]
    | keys as $k
    | [ [ $k[] ], [ $k[] ] ]
    | transpose 
    | map( {"headerName": .[0], "field": .[1]})
    | {"columnDefs" : ., "rowData": $rowData}
    ;


def addLayerDatatype:
    . as $rowData
    | [ [$rowData[]."Layer:Datatype" | split(":")[0] ] , [$rowData[]."Layer:Datatype" | split(":")[1]] ]
    | transpose
    | map( {"Layer": .[0], "Datatype": .[1]}) as $extra
    | [ [$rowData[]] , [$extra[]] ]
    | transpose
    | [.[] | add]
    ;

def ports:
    .modules.spm.ports
    ;

def netnames:
    .modules.spm.netnames | length
    ;