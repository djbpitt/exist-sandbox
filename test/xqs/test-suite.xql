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
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $tests:XML := document {
    <TEI xmlns="http://www.tei-c.org/ns/1.0">
        <text>
            <titleStmt>
                <title>My title</title>
                <respStmt><name>David</name></respStmt>
                <publicationStmt>
                    <date>2022-02-22</date>
                </publicationStmt>
            </titleStmt>
        </text>
    </TEI>
};
declare
    %test:setUp
function tests:_test-setup() {    
    xmldb:store("/db/apps/exist-sandbox", "test.xml", $tests:XML)
};
declare
    %test:tearDown
function tests:_test-teardown() {
    xmldb:remove("/db/apps/exist-sandbox", "test.xml")
};
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
    %test:assertXPath("count($result) eq 3")
    %test:assertXPath("$result[1] ! local-name(.) eq 'title'")
    %test:assertXPath("$result[1] ! namespace-uri(.) eq 'http://www.tei-c.org/ns/1.0'")
    %test:assertXPath("$result[1] eq 'My title'")
    %test:assertXPath("$result[2] ! local-name(.) eq 'name'")
    %test:assertXPath("$result[2] ! namespace-uri(.) eq 'http://www.tei-c.org/ns/1.0'")
    %test:assertXPath("$result[2] eq 'David'")
    %test:assertXPath("$result[3] ! local-name(.) eq 'date'")
    %test:assertXPath("$result[3] ! namespace-uri(.) eq 'http://www.tei-c.org/ns/1.0'")
    %test:assertXPath("$result[3] eq '2022-02-22'")
    function tests:pub-info() as element()+ {
        let $input as document-node() := doc("/db/apps/exist-sandbox/test.xml")
        return djb:pub-info($input)
    };
