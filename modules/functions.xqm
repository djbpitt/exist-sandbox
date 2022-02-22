xquery version "3.1";
(:module namespace:)
module namespace djb="http://www.obdurodon.org";
import module namespace test="http://exist-db.org/xquery/xqsuite" at "resource:org/exist/xquery/lib/xqsuite/xqsuite.xql";

declare 
%test:args(10) %test:assertEquals(100)
%test:args(11) %test:assertEquals(121)
function djb:square($input as xs:integer) as xs:double {
    $input * $input
};