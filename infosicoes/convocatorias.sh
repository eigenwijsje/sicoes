#!/bin/bash

OUT="../seguimiento/convocatorias.json"

source venv/bin/activate || exit 2

echo -n "ejecutando el rastreador: "
[ -e $OUT ] && rm $OUT

scrapy runspider convocatorias.py --nolog -o $OUT && echo OK

deactivate

