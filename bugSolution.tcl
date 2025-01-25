proc correct_append {list element} {
  lappend list element
}

set mylist {}
correct_append mylist a
correct_append mylist b
puts $mylist ; # Output: {a b}

#More robust solution handling various input types:
proc robust_append {list element} {
  if {[string is double -strict $element]} {
    lappend list [string trim $element]
  } elseif {[string is integer -strict $element]} {
    lappend list [expr {$element}]
  } elseif {[llength $element] > 0} {
    lappend list {*}$element
  } else {
    lappend list $element
  }
}

set mylist {}
robust_append mylist a
robust_append mylist 10
robust_append mylist 10.5
robust_append mylist {c d}
puts $mylist; #Output: {a 10 10.5 {c d}}