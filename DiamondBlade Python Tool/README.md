# DiamondBlade Python Tool
This README explains how to use the DiamondBlade Python Tool to automatically generate all properties for the DiamondBlade methodology.
## Workflow
### Analyzing the Design with OneSpin
1. Read your design into OneSpin and elaborate and compile it. \
2. Run the `analyze_design.tcl` script from the folder `helper_scripts` to generate the files `state_signals.txt`, `input_signals.txt`, `nodes.txt`, `fanin.txt` and `miter_info.txt` 
3. Store these files in the `src_files` folder.
### Usage of the Python Tool
1. Start the Python Tool by running `top.py`. The tool provides a simple user interface to run different commands. You can see a list of all commands by typing `help`. \
2. First you need to adjust the config file `config.py`. You need to set source, sink, the clock signal, the reset signal, the reset value, the path to the source files and the path to the macro templates. \
3. Next you need to run the `setup` command. It is the main command of the tool. It uses the information from the config file to prune the design, generate the miter and the forward, backward and intersection properties. If you run this command for the again for a design, you can skip the pruning and the tool will access the stored `.json` files. You will need to specify the number of unrollings `k` that should be considered. Start with 1 and increase it with every iteration.
4. After you generated the miter and the first properties, you can try to prove them with OneSpin. It is recommended to use the `report_result` command of OneSpin and then add these results to the file `results.txt` in the `src_files` folder.
5. When the forward and backward proofs do not lead to an intersection of the affectable nodes, it is still needed to conduct the inductive step proof. You can run the command `printStep` to generate the according property file (Note: it is necessary that you ran the setup command before that).
6. If you encounter more propagations in the counterexamples of the step proof, you need to add the affected signals via the `addAffNode` command, then you can run `printStep` again to generate the updated proof.

If you want to add blackboxing constraints, invariants or constraints for the software environment , you can refine the macro templates in the file `standard_macros.txt`. 
In case you want to use the cut signal functionality of OneSpin, you can run the command `getCutSignals`.
It prints a list of all signals of the DUV that can be pruned and a macro `cutSigEquivalence` is generated to constrain the newly created primary inputs of the DUV. Using cut signals is needed to conduct the proofs with Bounded Model Checking (BMC).
