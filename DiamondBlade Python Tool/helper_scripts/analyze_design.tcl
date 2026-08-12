clear_screen
unset -nocomplain state_signals
unset -nocomplain all_signals
unset -nocomplain fanin
unset -nocomplain sig
unset -nocomplain fanin_signal
unset -nocomplain fanin_sigs
unset -nocomplain old_length
unset -nocomplain new_length
unset -nocomplain sigs_to_check
unset -nocomplain new_sigs_to_check
unset -nocomplain new_signals
unset -nocomplain new_signal

set filename_miter_info "miter_info.txt"
set filename_state_sigs "state_signals.txt"
set filename_nodes "nodes.txt"
set filename_input_sigs "input_signals.txt"
set filename_fanin "fanin.txt"

set primary_IO [get_signals -filter {direction==input || direction==output} -unit -local]
set primary_IO [lsort -unique $primary_IO]
puts $primary_IO

set fileID [open $filename_miter_info "w"]

foreach sig $primary_IO {
	set direction [get_signal_info -direction $sig]
	set type [get_signal_info -type $sig]
	puts $fileID [concat $sig $direction $type]
}

close $fileID

puts "Write state signals to: $filename_state_sigs"
set fileID [open $filename_state_sigs "w"]
set state_signals [get_signals -filter {state==true} -unit]
puts $fileID $state_signals
close $fileID

puts "Write nodes to: $filename_nodes"
set fileID [open $filename_nodes "w"]
set nodes [get_signals -filter {state==true || direction==output || direction==input} -unit]
puts $fileID $nodes
close $fileID

puts "Write input signals to: $filename_input_sigs"
set fileID [open $filename_input_sigs "w"]
set input_signals [get_signals -filter {direction==input} -unit]
puts $fileID $input_signals
close $fileID

for {set i 0} {$i < [llength $nodes]} {incr i} {
	dict set fanin [lindex $nodes $i] [get_signal_info -fanin [lindex $nodes $i]]
}
set old_length [dict size $fanin]
puts "Initial length: $old_length"
set sigs_to_check []
set new_sigs_to_check []
dict for {sig fanin_sigs} $fanin {
	foreach fanin_signal $fanin_sigs {
		if {![dict exists $fanin $fanin_signal]} {
			# fanin_signal does not exist in the dictionary yet, add it and its fanin to dictionary fanin
			dict append fanin $fanin_signal [get_signal_info -fanin $fanin_signal]
			set new_signals [get_signal_info -fanin $fanin_signal]
			foreach new_signal $new_signals {
				if {![dict exists $fanin $new_signal]} {
					# add found signals to a list to check next
					set sigs_to_check [concat $sigs_to_check $new_signal]
					set sigs_to_check [lsort -unique $sigs_to_check]
				}
			}
		}
	}
}
#remove signals that got added to the dictionary
foreach sig $sigs_to_check {
	if {[dict exists $fanin $sig]} {
		set idx [lsearch $sigs_to_check $sig]
		set sigs_to_check [lreplace $sigs_to_check $idx $idx]
	}
}


set new_length [dict size $fanin]
puts "New Length: $new_length"
puts "Iteratively find all needed signals:"
set iteration 1
while {$old_length != $new_length} {
	#puts "Iteration: $iteration"
	set new_sigs_to_check []
	foreach sig $sigs_to_check {
		if {![dict exists $fanin $sig]} {
			# fanin_signal does not exist in the dictionary yet, add it and its fanin to dictionary fanin
			dict append fanin $sig [get_signal_info -fanin $sig]
			set new_signals [get_signal_info -fanin $sig]
			foreach new_signal $new_signals {
				if {![dict exists $fanin $new_signal]} {
					# add found signals to a list to check next
					set new_sigs_to_check [concat $new_sigs_to_check $new_signal]
					set new_sigs_to_check [lsort -unique $new_sigs_to_check]
				}
			}
		}
	}
	#remove signals that got added to the dictionary
	foreach sig $new_sigs_to_check {
		if {[dict exists $fanin $sig]} {
			set idx [lsearch $new_sigs_to_check $sig]
			set new_sigs_to_check [lreplace $new_sigs_to_check $idx $idx]
		}
	}
	set sigs_to_check $new_sigs_to_check
	set old_length $new_length
	set new_length [dict size $fanin]
	#puts "Old length: $old_length"
	#puts "New Length: $new_length"
	incr iteration
}

puts "Write all signals on the fanin path of the nodes and their respective fanin to: $filename_fanin"
set fileID [open $filename_fanin "w"]
dict for {sig fanin_sigs} $fanin {
	puts $fileID "Signal: $sig"
	puts $fileID "Fanin of Signal: $fanin_sigs"
}
close $fileID

puts "Done!"