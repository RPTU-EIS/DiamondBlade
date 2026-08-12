#name of the source signal or primary I/O
source_signal = "cptra_csr_hmac_key"
#name of the sink signal or primary I/O
sink_signal = "busy_o"
#name of the reset signal
reset_signal = "reset_n"
#name of the clock signal
clock_signal = "clk"
# value to activate reset
reset_value = "1'b0"
# relative path from top.py to files like state_signals.txt, seq_fan..., results.txt, nodes.txt, etc. folder path with "/" at the end
source_file_path = "src_files/"
#top name
top_name = "hmac"
# relative path to standard macros file
standard_macros_path = "src_files/standard_macros.txt"
