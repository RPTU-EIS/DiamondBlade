from os.path import exists

import analysis
import sys
import config

nodes = list()
fanin_dict = dict()
seq_fanin_dict = dict()
seq_fanout_dict = dict()
source_signals = list()
nodes_pruned = set()
input_signals = list()
candidates_source = list()
candidates_sink = list()
intersection = list()
k_max = 0
proof_fails_forward = list()
proof_holds_forward = list()
proof_fails_backward = list()
proof_holds_backward = list()

print("Welcome to the DiamondBlade Python Tool!")
while True:
    print("Choose what to do next: ")
    cmd = input()
    if cmd == "help":
        print(analysis.HELP_TEXT)
    elif cmd == "exit":
        print("Terminating the Tool")
        break
    elif cmd == "setup":
        print("Please prepare all files in a folder specified in the config.py file")
        # preprocess nodes, state_signals, miter_info, input_signals, fanin
        analysis.preprocess_design_files(config.source_file_path)
        # read nodes.txt
        filename = config.source_file_path + "nodes.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            continue
        nodes = list(set(analysis.read_nodes(filename)))
        # read state_signals.txt
        filename = config.source_file_path + "state_signals.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            continue
        state_signals = analysis.read_state_signals(filename)
        # read input_signals.txt
        filename = config.source_file_path + "input_signals.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            continue
        input_signals = list(set(analysis.read_input_signals(filename)))

        print(
            "Do you want to use prior results located at the in config specified path seq_fanout.json, seq_fanin.json, seq_fanout_pruned.json and seq_fanin_pruned.json? Then type Y, else type something different.")
        use_results = input()
        if use_results == "Y":
            filename = config.source_file_path + "seq_fanout.json"
            seq_fanout_dict = analysis.load_seq_fanout_json(filename)
            filename = config.source_file_path + "seq_fanin.json"
            seq_fanin_dict = analysis.load_seq_fanin_json(filename)

        else:
            # read fanin.txt
            filename = config.source_file_path + "fanin.txt"
            if not exists(filename):
                print("There is no file at: " + filename)
                continue
            fanin_dict = analysis.read_fanin_information(filename)
            seq_fanin_dict = analysis.compute_seq_fanin(nodes, fanin_dict)
            seq_fanout_dict = analysis.compute_seq_fanout(nodes, seq_fanin_dict)

            filename = config.source_file_path + "seq_fanout.json"
            analysis.save_seq_fanout_json(seq_fanout_dict, filename)
            filename = config.source_file_path + "seq_fanin.json"
            analysis.save_seq_fanin_json(seq_fanin_dict, filename)

        # set source
        source_signals = [config.source_signal]
        for sig in source_signals:
            if sig not in seq_fanout_dict:
                print("Signal \"" + sig + "\" not in fanout dictionary, please check the spelling again")
                source_signals = list()
                continue

        # set sink
        sink_signal = [config.sink_signal]
        for sig in sink_signal:
            if sig not in seq_fanin_dict:
                print("Signal \"" + sig + "\" not in fanin dictionary, please check the spelling again")
                sink_signal = list()
                continue

        if use_results == "Y":
            filename = config.source_file_path + "seq_fanout_pruned.json"
            E_pot = analysis.load_seq_fanout_json(filename)
            nodes_pruned = analysis.prune_nodes(E_pot)
            filename = config.source_file_path + "seq_fanin_pruned.json"
            E_pot_backward = analysis.load_seq_fanin_json(filename)
        else:
            # prune fanout
            print("Prune Design")
            E_pot = analysis.prune_fanout(seq_fanout_dict, source_signals, sink_signal)
            nodes_pruned = analysis.prune_nodes(E_pot)
            E_pot_backward = analysis.compute_E_pot_backward(nodes_pruned, E_pot)
            print("Done pruning!")
            filename = config.source_file_path + "seq_fanout_pruned.json"
            analysis.save_seq_fanout_json(E_pot, filename)
            filename = config.source_file_path + "seq_fanin_pruned.json"
            analysis.save_seq_fanout_json(E_pot_backward, filename)

        # generate miter for given top level module
        top_name = config.top_name
        analysis.printMiter(config.source_file_path + "miter_info.txt", top_name)
        print("Miter generated!")

        # set the number of considered unrollings k_max
        print("Please specify the number of unrollings k:")
        k_max = int(input())

        # read proof results
        filename = config.source_file_path + "results.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            print("Creating empty file at: " + filename)
            open(filename, 'w').close()
        proof_holds_forward = analysis.read_holds_forward(filename, k_max)
        proof_holds_backward = analysis.read_holds_backward(filename, k_max)
        proof_fails_forward = analysis.read_fails_forward(filename, k_max)
        proof_fails_backward = analysis.read_fails_backward(filename, k_max)

        if k_max > 1:
            if proof_fails_backward and proof_fails_forward:
                intersection_cand = analysis.findSignalIntersections(proof_fails_forward, proof_fails_backward)

                if intersection_cand:
                    analysis.printDiamondBladeIntersectionProperties(config.source_signal, config.sink_signal,
                                                                     intersection_cand[0], intersection_cand[1],
                                                                     state_signals, input_signals)
                    print("Intersection found, Property generated.")
                else:
                    print("No intersection between forward and backward path.")
            else:
                print("No intersection possible because no property failed.")

        # generate DiamondBlade forward and backward properties
        analysis.printDiamondBladeProperties(source_signals, sink_signal, E_pot, E_pot_backward, k_max,
                                             proof_fails_forward, proof_fails_backward, proof_holds_forward,
                                             proof_holds_backward, state_signals, input_signals)
    elif cmd == "printStep":
        # read state_signals.txt
        filename = config.source_file_path + "state_signals.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            continue
        state_signals = analysis.read_state_signals(filename)
        # read input_signals.txt
        filename = config.source_file_path + "input_signals.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            continue
        input_signals = list(set(analysis.read_input_signals(filename)))
        # load Epot
        filename = config.source_file_path + "seq_fanout_pruned.json"
        if not exists(filename):
            print("There is no file at: " + filename)
            continue
        E_pot = analysis.load_seq_fanout_json(filename)
        # read proof results
        filename = config.source_file_path + "results.txt"
        if not exists(filename):
            print("There is no file at: " + filename)
            print("Creating empty file at: " + filename)
            open(filename, 'w').close()
        # set k_max
        print("Please specify the number of unrollings k that were checked so far:")
        k_max = int(input())
        proof_fails_forward = analysis.read_fails_forward(filename, k_max)

        # print Step property
        analysis.printStep(proof_fails_forward, [config.source_signal], state_signals, input_signals, E_pot)
    elif cmd == "addAffNode":
        print("Give the hierarchical name of the signal to add:\n")
        node = input().split()
        proof_fails_forward = analysis.addAffectableNode(proof_fails_forward, node)
    elif cmd == "getCutSignals":
        cutSigs = list()
        for sig in nodes:
            if sig not in nodes_pruned and sig not in input_signals:
                cutSigs.append(sig)
        cutSigs.sort()
        cutSigsString = list()
        for sig in cutSigs:
            cutSigsString.append("{DUV1." + sig + "}")
            cutSigsString.append("{DUV2." + sig + "}")
        filename = "Generated_Files/cutSignals.txt"
        open(filename, 'w').close()
        original_std_out = sys.stdout
        with open(filename, 'a') as file:
            sys.stdout = file
            for sig in cutSigsString:
                print(sig, end=" ")
            print()
            cutSigEquivalence = str()
            cutSigEquivalence += "function automatic cutSigEquivalence();\n"
            cutSigEquivalence += "\tcutSigEquivalence = (\n"
            for sig in cutSigs:
                cutSigEquivalence += "\t\t(DUV1." + sig + " == DUV2." + sig + ")"
                if sig == cutSigs[-1]:
                    cutSigEquivalence += "\n"
                else:
                    cutSigEquivalence += " &&\n"
            cutSigEquivalence += "\t);\n"
            cutSigEquivalence += "endfunction\n\n"
            print(cutSigEquivalence)
        sys.stdout = original_std_out
        print("Cut Signals stored in Generated_Files/cutSignals.txt")
    else:
        print("Invalid command, type \"help\" for information about the available commands")
