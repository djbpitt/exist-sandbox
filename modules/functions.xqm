xquery version "3.1";
(:module namespace:)
module namespace djb="http://www.obdurodon.org";

declare function djb:square($input as xs:integer) as xs:double {
    $input * $input
};
