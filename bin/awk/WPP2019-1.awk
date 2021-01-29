# AWK
# Generate SQL INSERT statements from splited 12411-0013.csv

BEGIN {
    i = 1 ;
    cc = 0 ;
    sc = 0 ;
    yr = 0 ;
    AG = -1;
    NL = "C";
}
{
    if ( $1 == NL ) {
        cc = $2;
        sc = $3;
        yr = $4;
        AG = 0;
        i = 1 ;
    } else {
        if ( AG < 101) {
            printf ( "%s,%s,%s,%0.f\n",cc,yr , AG, $1 * 1000 ) ;
        }
        AG = AG + 1 ;
    }
}
