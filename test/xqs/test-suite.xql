xquery version "3.1";

(:~ This library module contains XQSuite tests for the exist-sandbox app.
 :
 : @author djb
 : @version 1.0.0
 : @see http://www.obdurodon.org
 :)

module namespace tests = "http://www.obdurodon.org/apps/exist-sandbox/tests";
import module namespace djb="http://www.obdurodon.org" at "../../modules/functions.xqm";
declare namespace test="http://exist-db.org/xquery/xqsuite";

declare
    %test:arg("input", 10)
    %test:assertEquals(100)
    function tests:square-10($input as xs:integer) as xs:double {
        djb:square($input)
    };
declare
    %test:arg("input", 11)
    %test:assertEquals(121)
    function tests:square-11($input as xs:integer) as xs:double {
        djb:square($input)
    };

declare
    %test:name('one-is-one')
    %test:assertTrue
    function tests:tautology() as xs:boolean {
        1 = 1
};
