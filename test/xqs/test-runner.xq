xquery version "3.1";

(:~ This library runs the XQSuite unit tests for the exist-sandbox app.
 :
 : @author djb
 : @version 1.0.0
 : @see http://www.exist-db.org/exist/apps/doc/xqsuite
 :)
import module namespace test="http://exist-db.org/xquery/xqsuite" at "resource:org/exist/xquery/lib/xqsuite/xqsuite.xql";
import module namespace tests="http://www.obdurodon.org/apps/exist-sandbox/tests" at "test-suite.xql";

declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xml";
declare option output:media-type "application/xml";

let $result as element(testsuites) := test:suite(
  inspect:module-functions(xs:anyURI("test-suite.xql"))
) 
let $store-result as xs:boolean? := 
  file:serialize($result, '/Users/djb/repos/exist-sandbox/test/xqs/test-results.xml', ())
return $result
