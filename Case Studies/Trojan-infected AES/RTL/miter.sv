module miter (
	input logic[127:0] block_1,
	input logic[127:0] block_2,
	input logic clk,
	input logic encdec_1,
	input logic encdec_2,
	input logic init_1,
	input logic init_2,
	input logic[255:0] key_1,
	input logic[255:0] key_2,
	input logic keylen_1,
	input logic keylen_2,
	input logic next_1,
	input logic next_2,
	output logic ready_1,
	output logic ready_2,
	input logic reset_n,
	output logic[127:0] result_1,
	output logic[127:0] result_2,
	output logic result_valid_1,
	output logic result_valid_2
);

	aes_core DUV1(
		.block(block_1),
		.clk(clk),
		.encdec(encdec_1),
		.init(init_1),
		.key(key_1),
		.keylen(keylen_1),
		.next(next_1),
		.ready(ready_1),
		.reset_n(reset_n),
		.result(result_1),
		.result_valid(result_valid_1)
	);

	aes_core DUV2(
		.block(block_2),
		.clk(clk),
		.encdec(encdec_2),
		.init(init_2),
		.key(key_2),
		.keylen(keylen_2),
		.next(next_2),
		.ready(ready_2),
		.reset_n(reset_n),
		.result(result_2),
		.result_valid(result_valid_2)
	);

endmodule
