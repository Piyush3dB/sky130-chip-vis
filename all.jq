
def json2xpath:
    [
        paths |
        map(select(type!="number"))
    ]|
    # sort |    # uncomment to loose order
    # unique |  # uncomment to loose counts
    .[] |
    select(length>0) |
    "./" + join("/")
    ;


def json2jqpath:
    [
        paths | 
        .[1:] |
        map(select(type == "string") //  "[]") |
        "." + join("|.") |
        tostring 
    ] |
    unique |
    sort |
    .[]
    ;


def ports:
    .modules.spm.ports
    ;

def netnames:
    .modules.spm.netnames
    | .
    ;

def cells:
    .modules.spm.cells
    ;

def netnames:
    .modules.spm.netnames
    | .bits
    ;
