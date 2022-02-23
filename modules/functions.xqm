xquery version "3.1";
(:module namespace:)
module namespace djb="http://www.obdurodon.org";
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare function djb:square($input as xs:integer) as xs:double {
    $input * $input
};

declare function djb:pub-info($input as document-node()) as element()+ {
    let $storytitle as element(tei:title) := $input//tei:titleStmt/tei:title
    let $pub as element(tei:name):= $input//tei:respStmt[1]/tei:name
    let $date as element(tei:date) := $input//tei:publicationStmt/tei:date
  return
      ($storytitle, $pub, $date)
    
}; 