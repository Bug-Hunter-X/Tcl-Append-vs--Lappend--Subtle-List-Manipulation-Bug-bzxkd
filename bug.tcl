proc wrong_append {list element} {
  append list element
}

set mylist {}
wrong_append mylist a
wrong_append mylist b
puts $mylist ; # Output: ab

proc correct_append {list element} {
  lappend list element
}

set mylist {}
correct_append mylist a
correct_append mylist b
puts $mylist ; # Output: {a b}