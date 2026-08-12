import json
import sys
import config
import re


def preprocess_design_files(source_file_path):
    # remove braces from nodes.txt string and replaces them with empty string in the file
    FILENAME = source_file_path + "nodes"
    with open(FILENAME + ".txt", 'r') as f:
        text = f.read()
        # generating new string without braces
        patn = re.sub(r"[\{}]", "", text)
    with open(FILENAME + ".txt", 'w') as f:
        f.write(patn)

    # remove braces from state_signals.txt
    FILENAME = source_file_path + "state_signals"
    with open(FILENAME + ".txt", 'r') as f:
        text = f.read()
        patn = re.sub(r"[\{}]", "", text)
    with open(FILENAME + ".txt", 'w') as f:
        f.write(patn)

    # remove braces from miter_info.txt
    FILENAME = source_file_path + "miter_info"
    with open(FILENAME + ".txt", 'r') as f:
        text = f.read()
        patn = re.sub(r"[\{}]", "", text)
    with open(FILENAME + ".txt", 'w') as f:
        f.write(patn)

    # remove braces from input_signals.txt
    FILENAME = source_file_path + "input_signals"
    with open(FILENAME + ".txt", 'r') as f:
        text = f.read()
        patn = re.sub(r"[\{}]", "", text)
    with open(FILENAME + ".txt", 'w') as f:
        f.write(patn)

    # remove braces from fanin.txt
    FILENAME = source_file_path + "fanin"
    with open(FILENAME + ".txt", 'r') as f:
        text = f.read()
        patn = re.sub(r"[\{}]", "", text)
    with open(FILENAME + ".txt", 'w') as f:
        f.write(patn)


# read nodes file and create a list
def read_nodes(filename):
    print("Read Nodes File at " + str(filename))
    with open(filename) as f:
        for line in f:
            nodes = line.replace("\n", "").split(' ')
    print("Done!")
    return nodes


# read state signals file and create a list
def read_state_signals(filename):
    print("Read State Signals File at " + str(filename))
    with open(filename) as f:
        for line in f:
            state_signals = line.replace("\n", "").split(' ')
    print("Done!")
    return state_signals


# read inputs file and create a list
def read_input_signals(filename):
    print("Read Input Signals File at " + str(filename))
    with open(filename) as f:
        for line in f:
            input_signals = line.replace("\n", "").split(' ')
    print("Done!")
    return input_signals


# read fanin information and create the dictionary fanin_dict which stores each signal and its fanin signals
# key is the signal name found in every first line read (i==0)
# value is the list of signals found in every second line read (i==1)
def read_fanin_information(filename):
    fanin = dict()
    print("Read Fanin File at " + str(filename))
    with open(filename) as f:
        i = 0
        for line in f:
            if i == 0:
                signal_name = line[8:].replace("\n", "")
            if i == 1:
                signal_fanin = set(line[17:].replace("\n", "").split(' '))
                fanin.update({signal_name: signal_fanin})
            i = (i + 1) % 2
    print("Done!")
    return fanin


# computation of sequential fanin
def compute_seq_fanin(state_signals, fanin_dict):
    seq_fanin = dict()  # dictionary that stores the sequential fanin of each state signal
    print("Compute sequential fanin:")
    # for each state signal: iteratively find fanin until the fixed point is reached
    for state_sig in state_signals:
        need_to_check = set(
            fanin_dict[state_sig])  # initialize with immediate fanin signals (combinational and sequential)
        checked = set()  # initialize as empty
        sequential = set()  # initialize as empty
        if '' in need_to_check and len(need_to_check) == 1:
            need_to_check.pop()
        while len(need_to_check):  # loop until no more signals need to be checked
            # take one element from need_to_check and remove it from the set
            element = need_to_check.pop()
            # if element is a state_signal, add it to checked and sequential and continue the next iteration
            if element in state_signals:
                checked.add(element)
                sequential.add(element)
                continue
            # tolerant Access: if element not in fanin_dict, set its fanin to empty set
            element_fanin = fanin_dict.get(element, set())
            if element not in fanin_dict:
                # Debug info
                print("Warning: no fanin information for signal:", element)
            add_to_check = set()
            # filter out signals with no fanin
            if "" not in element_fanin:
                for sig in element_fanin:
                    # only add signals to add_to_check if they are not contained in need_to_check or checked set
                    if (sig not in checked) and (sig not in need_to_check):
                        add_to_check.add(sig)
                need_to_check.update(add_to_check)
            checked.add(element)
        seq_fanin.update({state_sig: sequential})
    for state_sig in seq_fanin:
        seq_fanin[state_sig] = list(seq_fanin[state_sig])
    print("Done!")
    return seq_fanin


def compute_seq_fanout(state_signals, seq_fanin_dict):
    # initialize fanout dict with state signals as keys and empty values
    seq_fanout = dict()
    print("Compute sequential fanout:")
    for sig in state_signals:
        seq_fanout.update({sig: set()})
    # iterate over sequential fanin dictionary with signal as key and fanin as value
    # all signals in the fanin have the key signal as their fanout
    for state_sig in state_signals:
        for fanin_sig in seq_fanin_dict[state_sig]:
            seq_fanout[fanin_sig].add(state_sig)
    for state_sig in seq_fanout:
        seq_fanout[state_sig] = list(seq_fanout[state_sig])
    print("Done!")
    return seq_fanout


def save_seq_fanout_json(fanout, filename):
    with open(filename, 'w') as fp:
        json.dump(fanout, fp, sort_keys=True, indent=1)
    print("Done!")


def save_seq_fanin_json(fanin, filename):
    with open(filename, 'w') as fp:
        json.dump(fanin, fp, sort_keys=True, indent=1)
    print("Done!")


def load_seq_fanout_json(filename):
    with open(filename, 'r') as fp:
        data = json.load(fp)
    print("Done loading fanout!")
    return data


def load_seq_fanin_json(filename):
    with open(filename, 'r') as fp:
        data = json.load(fp)
    print("Done loading fanin!")
    return data


def read_holds_forward(filename, k_max):
    proof_holds_forward = [[] for _ in range(k_max)]
    with open(filename) as f:
        lines = f.readlines()
        for k in range(k_max):
            for line in lines:
                if line.find("DiamondBlade") != -1 and line.find("hold_bounded") == -1 and line.find(
                        "_cycle" + str(k + 1)) != -1 and line.find("_forward_") != -1:
                    i = line.find("DiamondBlade_forward_") + 21
                    j = line.find("_cycle" + str(k + 1) + "prop")
                    pvar = line[i:j]
                    pvar = pvar.replace('$', '.')
                    proof_holds_forward[k].append(pvar)
    return proof_holds_forward


def read_holds_backward(filename, k_max):
    proof_holds_backward = [[] for _ in range(k_max)]
    with open(filename) as f:
        lines = f.readlines()
        for k in range(k_max):
            for line in lines:
                if line.find("DiamondBlade") != -1 and line.find("hold_bounded") == -1 and line.find(
                        "_cycle" + str(k + 1)) != -1 and line.find("_backward_") != -1:
                    i = line.find("DiamondBlade_backward_") + 22
                    j = line.find("_cycle" + str(k + 1) + "prop")
                    pvar = line[i:j]
                    pvar = pvar.replace('$', '.')
                    proof_holds_backward[k].append(pvar)
    return proof_holds_backward


def read_fails_forward(filename, k_max):
    proof_fails_forward = [[] for _ in range(k_max)]
    with open(filename) as f:
        lines = f.readlines()
        for k in range(k_max):
            for line in lines:
                if line.find("DiamondBlade") != -1 and line.find("hold_bounded") != -1 and line.find(
                        "_cycle" + str(k + 1)) != -1 and line.find("_forward_") != -1:
                    i = line.find("DiamondBlade_forward_") + 21
                    j = line.find("_cycle" + str(k + 1) + "prop")
                    pvar = line[i:j]
                    pvar = pvar.replace('$', '.')
                    proof_fails_forward[k].append(pvar)
    return proof_fails_forward


def read_fails_backward(filename, k_max):
    proof_fails_backward = [[] for _ in range(k_max)]
    with open(filename) as f:
        lines = f.readlines()
        for k in range(k_max):
            for line in lines:
                if line.find("DiamondBlade") != -1 and line.find("hold_bounded") != -1 and line.find(
                        "_cycle" + str(k + 1)) != -1 and line.find("_backward_") != -1:
                    i = line.find("DiamondBlade_backward_") + 22
                    j = line.find("_cycle" + str(k + 1) + "prop")
                    pvar = line[i:j]
                    pvar = pvar.replace('$', '.')
                    proof_fails_backward[k].append(pvar)
    return proof_fails_backward


def prune_fanout(fanout, source, sink):
    # forward traversal from source
    E_src = dict()
    V_chk = set(source)
    V_cov = set()
    # check if set is non-empty
    while bool(V_chk):
        v_cand = V_chk.pop()
        # add {key,value} pair to E_src consisting of the candidate and all of its fanout signals
        E_src.update({v_cand: fanout[v_cand]})
        # mark v_cand as covered
        V_cov.add(v_cand)
        # add new candidates to V_chk if not contained in V_cov
        for sig in fanout[v_cand]:
            if sig not in V_cov:
                V_chk.add(sig)
    # backward traversal from sink
    E_pot = dict()
    E_pot.update({sink[0]: list()})
    V_chk = set(sink)
    V_cov = set()
    # check if set is non-empty
    while bool(V_chk):
        v_cand = V_chk.pop()
        # mark v_cand as covered
        V_cov.add(v_cand)
        # if fanin_sig is a value in any (key,value) pair of fanout add the edge (fanin_sig, v_cand) to E_pot
        for key, value in E_src.items():
            if v_cand in value:
                if key in E_pot.keys():
                    new_value = E_pot[key]
                    new_value.append(v_cand)
                    E_pot.update({key: new_value})
                else:
                    E_pot.update({key: [v_cand]})
                if key not in V_cov:
                    V_chk.add(key)
    return E_pot


def prune_nodes(E_pot):
    nodes_pruned = set()
    for node in E_pot.keys():
        nodes_pruned.add(node)
    return nodes_pruned


def compute_E_pot_backward(nodes, E_pot):
    # initialize E_pot_backward dict with nodes as keys and empty values
    E_pot_backward = dict()
    for node in nodes:
        E_pot_backward.update({node: set()})
    # iterate over E_pot with node as key and fanout as value
    # all signals in the fanout have the key signal as their fanin
    for node in nodes:
        for fanout_sig in E_pot[node]:
            E_pot_backward[fanout_sig].add(node)
    for node in E_pot_backward:
        E_pot_backward[node] = list(E_pot_backward[node])
    print("Done!")
    return E_pot_backward


def findSignalIntersections(proof_fails_forward, proof_fails_backward):
    # build index maps
    index_map_1 = {state: i + 1 for i, sublist in enumerate(proof_fails_forward) for state in sublist}
    index_map_2 = {state: i + 1 for i, sublist in enumerate(proof_fails_backward) for state in sublist}

    # find common signals in both lists
    common_states = set(index_map_1.keys()) & set(index_map_2.keys())

    if not common_states:
        return None

    # build list with intersection states
    candidates = []
    for state in common_states:
        sum_of_cycles = index_map_1[state] + index_map_2[state]
        candidates.append((sum_of_cycles, state))

    # filter for the state with the lowest sum of cycles min() uses the first element of the tuple to sort by default
    lowest_sum = min(candidates)

    return lowest_sum


def read_file(filepath):
    # Reads the complete contents of a text file and returns it as a string.

    # This function is a low-level utility used throughout the toolchain to load
    # RTL source files before any preprocessing or analysis is performed.
    # It handles common file-related errors gracefully and reports them via
    # the global warnings list instead of raising exceptions.

    # Parameters
    # ----------
    # filepath : Path or str
    #     Path to the file that should be read.

    # Returns
    # -------
    # str
    #     The full file content as a string.
    #     Returns an empty string if the file cannot be read.

    # Warnings
    # --------
    # FILE_NOT_FOUND_ERROR
    #     If the file does not exist.
    # PERMISSION_ERROR
    #     If the file cannot be accessed due to missing permissions.
    # ENCODING_ERROR
    #     If the file is not UTF-8 decodable.
    # OS_ERROR
    #     For any other operating system related file access error.

    try:
        with open(filepath, encoding="utf-8") as f:
            file_text = f.read()

        return file_text

    except FileNotFoundError:
        print("No file found at " + str(filepath))
        return ""

    except PermissionError:
        print("Permission denied for file at " + str(filepath))
        return ""

    except UnicodeDecodeError:
        print("Could not decode file at " + str(filepath) + ". Ensure it is UTF-8 encoded.")
        return ""

    except OSError:
        print("OS error occurred while accessing file at " + str(filepath))
        return ""


def printDiamondBladeIntersectionProperties(source, sink, k, intersection_state, state_signals,
                                            input_signals):
    # forward path
    # print properties
    filename = "Generated_Files/DiamondBlade_Intersection_" + intersection_state + ".sva"
    open(filename, 'w').close()
    original_std_out = sys.stdout
    with open(filename, 'a') as file:
        sys.stdout = file

        # module declaration
        module_decl = 'module DB_AIP_fw_cycle' + str(
            k + 1) + '(' + config.clock_signal + ',' + config.reset_signal + ');\n'

        module_decl += 'input ' + config.clock_signal + ';\n'
        module_decl += 'input ' + config.reset_signal + ';\n\n'

        # blackboxing, sw_env and invariants functions
        standard_macros = read_file(config.standard_macros_path)
        if standard_macros == "":
            sys.exit("Error: Could not read standard macros file.")

        # invariant assumption macro
        invariant_assumption_macro = 'invariant_assumption: assume property(@(posedge ' + config.clock_signal + ') disable iff(' + config.reset_signal + '== ' + config.reset_value + ') invariants());\n\n'

        # include TiDAL
        tidal_include = ''
        tidal_include += '//System Verilog library for TiDAL\n'
        tidal_include += '`include "tidal.sv"\n\n'
        tidal_include += '//TiDAL properties must be enclosed within begin_tda and end_tda macros\n'
        tidal_include += '`begin_tda(tda)\n'

        tidal_end = '`end_tda\n'

        # print input equivalence
        input_equivalence = ''
        # start of declaration
        input_equivalence += 'function automatic input_equivalence_except_src();\n'
        input_equivalence += '\tinput_equivalence_except_src = (\n'
        # main body
        i = 0
        while i < len(input_signals):
            if input_signals[i] not in source:
                input_equivalence += '\t\t(DUV1.' + input_signals[i] + ' == DUV2.' + input_signals[i] + ')'
                if i == len(input_signals) - 1:
                    input_equivalence += '\n'
                else:
                    input_equivalence += ' &&\n'
            i += 1
        # end of declaration
        input_equivalence += '\t);\n'
        input_equivalence += 'endfunction\n\n'

        # state_equivalence_except_src part
        state_equivalence = ''

        i = 0
        j = 0
        while i < len(state_signals):
            # start of declaration
            state_equivalence += 'function automatic state_equivalence_except_src_' + str(j) + '();\n'
            state_equivalence += '\tstate_equivalence_except_src_' + str(j) + ' = (\n'
            while i < len(state_signals) and (i == 1000 * j or i % 1000 != 0):
                if state_signals[i] not in source:
                    state_equivalence += '\t\t(DUV1.' + state_signals[i] + ' == DUV2.' + state_signals[i] + ')'
                    if i == len(state_signals) - 1 or i == len(state_signals) - 2 and state_signals[
                        len(state_signals) - 1] == source or (i % (j * 1000 + 999)) == 0 and i != 0:
                        state_equivalence += '\n'
                    else:
                        state_equivalence += ' &&\n'
                i += 1
            state_equivalence += '\t);\n'
            state_equivalence += 'endfunction\n\n'
            j += 1
        # end of declaration
        state_equivalence += 'function automatic state_equivalence_except_src();\n'
        state_equivalence += '\tstate_equivalence_except_src = (\n'
        for tmp in range(j):
            state_equivalence += '\t\tstate_equivalence_except_src_' + str(tmp) + '()'
            if tmp < j - 1:
                state_equivalence += ' &&\n'
            else:
                state_equivalence += '\n'
        state_equivalence += '\t);\n'
        state_equivalence += 'endfunction\n\n'

        print(module_decl)
        print(standard_macros)
        print(invariant_assumption_macro)
        print(tidal_include)
        print(input_equivalence)
        print(state_equivalence)
    sys.stdout = original_std_out

    if sink in state_signals:
        printPropertyForward(sink, k, filename)
    else:
        printPropertyForward(sink, k - 1, filename)

    end_module = 'endmodule\n\n'

    bind_statement = '//Bind assertion module to DUV\n'
    bind_statement += 'bind miter DB_AIP_fw_cycle' + str(k + 1) + ' inst_DB_AIP_fw_cycle' + str(
        k + 1) + '(.' + config.clock_signal + '(' + config.clock_signal + '), .' + config.reset_signal + '(' + config.reset_signal + '));\n'

    original_std_out = sys.stdout
    with open(filename, 'a') as file:
        sys.stdout = file
        print(tidal_end)
        print(end_module)
        print(bind_statement)
    sys.stdout = original_std_out

    # print
    print("Property File " + filename + " generated\n")
    return


def printDiamondBladeProperties(source, sink, E_pot, E_pot_backward, k_max, proof_fails_forward, proof_fails_backward,
                                proof_holds_forward, proof_holds_backward, state_signals,
                                input_signals):
    # forward path
    candidates = list([] for _ in range(k_max + 1))
    candidates[0] = source
    for k in range(k_max):
        # find new candidates for forward path
        new_candidates = list()
        for sigs in candidates[k]:
            # do not look at the fanout of signals for which the proof already holds
            if k != 0:
                if sigs not in proof_holds_forward[k - 1]:
                    if E_pot.get(sigs) is not None:
                        new_candidates = new_candidates + E_pot[sigs]
                    else:
                        print("Warning: signal", sigs, "is not in E_pot!")
            else:
                if E_pot.get(sigs) is not None:
                    new_candidates = new_candidates + E_pot[sigs]
                else:
                    print("Warning: signal", sigs, "has no fanout in pruned graph!")
        candidates[k + 1] = new_candidates
        # post-processing of list of possible forward candidates
        # make lists unique
        candidates[k + 1] = list(set(candidates[k + 1]))
        # remove source from list, since it is initially tainted anyway
        for sig in source:
            if sig in candidates[k + 1]:
                candidates[k + 1].remove(sig)
        # if no new candidates were found in this iteration stop here
        candidates[k + 1].sort()
        if candidates[k + 1] == candidates[k]:
            print(
                "No more new forward candidates can be found in cycle " + str(k + 1) + "!\n")
        # remove signals from earlier iterations, but only if they were already failing
        to_remove = list()
        if k != 0:
            for cand in candidates[k + 1]:
                for i in range(k):
                    if cand in proof_fails_forward[i]:
                        to_remove.append(cand)
            for cand in to_remove:
                candidates[k + 1].remove(cand)
        # print properties
        if candidates[k + 1]:
            filename = "Generated_Files/DiamondBlade_forward_cycle" + str(k + 1) + ".sva"
            open(filename, 'w').close()
            original_std_out = sys.stdout
            with open(filename, 'a') as file:
                sys.stdout = file

                # module declaration
                module_decl = 'module DB_AIP_fw_cycle' + str(
                    k + 1) + '(' + config.clock_signal + ',' + config.reset_signal + ');\n'

                module_decl += 'input ' + config.clock_signal + ';\n'
                module_decl += 'input ' + config.reset_signal + ';\n\n'

                # blackboxing, sw_env and invariants functions
                standard_macros = read_file(config.standard_macros_path)
                if standard_macros == "":
                    sys.exit("Error: Could not read standard macros file.")

                # invariant assumption macro
                invariant_assumption_macro = 'invariant_assumption: assume property(@(posedge ' + config.clock_signal + ') disable iff(' + config.reset_signal + '== ' + config.reset_value + ') invariants());\n\n'

                # include TiDAL
                tidal_include = ''
                tidal_include += '//System Verilog library for TiDAL\n'
                tidal_include += '`include "tidal.sv"\n\n'
                tidal_include += '//TiDAL properties must be enclosed within begin_tda and end_tda macros\n'
                tidal_include += '`begin_tda(tda)\n'

                tidal_end = '`end_tda\n'

                # print input equivalence
                input_equivalence = ''
                # start of declaration
                input_equivalence += 'function automatic input_equivalence_except_src();\n'
                input_equivalence += '\tinput_equivalence_except_src = (\n'
                # main body
                i = 0
                while i < len(input_signals):
                    if input_signals[i] not in source:
                        input_equivalence += '\t\t(DUV1.' + input_signals[i] + ' == DUV2.' + input_signals[i] + ')'
                        if i == len(input_signals) - 1:
                            input_equivalence += '\n'
                        else:
                            input_equivalence += ' &&\n'
                    i += 1
                # end of declaration
                input_equivalence += '\t);\n'
                input_equivalence += 'endfunction\n\n'

                # state_equivalence_except_src part
                state_equivalence = ''

                i = 0
                j = 0
                while i < len(state_signals):
                    # start of declaration
                    state_equivalence += 'function automatic state_equivalence_except_src_' + str(j) + '();\n'
                    state_equivalence += '\tstate_equivalence_except_src_' + str(j) + ' = (\n'
                    while i < len(state_signals) and (i == 1000 * j or i % 1000 != 0):
                        if state_signals[i] not in source:
                            state_equivalence += '\t\t(DUV1.' + state_signals[i] + ' == DUV2.' + state_signals[i] + ')'
                            if i == len(state_signals) - 1 or i == len(state_signals) - 2 and state_signals[
                                len(state_signals) - 1] == source or (i % (j * 1000 + 999)) == 0 and i != 0:
                                state_equivalence += '\n'
                            else:
                                state_equivalence += ' &&\n'
                        i += 1
                    state_equivalence += '\t);\n'
                    state_equivalence += 'endfunction\n\n'
                    j += 1
                # end of declaration
                state_equivalence += 'function automatic state_equivalence_except_src();\n'
                state_equivalence += '\tstate_equivalence_except_src = (\n'
                for tmp in range(j):
                    state_equivalence += '\t\tstate_equivalence_except_src_' + str(tmp) + '()'
                    if tmp < j - 1:
                        state_equivalence += ' &&\n'
                    else:
                        state_equivalence += '\n'
                state_equivalence += '\t);\n'
                state_equivalence += 'endfunction\n\n'

                print(module_decl)
                print(standard_macros)
                print(invariant_assumption_macro)
                print(tidal_include)
                print(input_equivalence)
                print(state_equivalence)
            sys.stdout = original_std_out

            for cand in candidates[k + 1]:
                printPropertyForward(cand, k + 1, filename)

            end_module = 'endmodule\n\n'

            bind_statement = '//Bind assertion module to DUV\n'
            bind_statement += 'bind miter DB_AIP_fw_cycle' + str(k + 1) + ' inst_DB_AIP_fw_cycle' + str(
                k + 1) + '(.' + config.clock_signal + '(' + config.clock_signal + '), .' + config.reset_signal + '(' + config.reset_signal + '));\n'

            original_std_out = sys.stdout
            with open(filename, 'a') as file:
                sys.stdout = file
                print(tidal_end)
                print(end_module)
                print(bind_statement)
            sys.stdout = original_std_out

            # print number of candidates per cycle
            print("Number of forward candidates in cycle " + str(k + 1) + ": " + str(len(candidates[k + 1])) + "\n")
        else:
            print("No forward candidates found in cycle " + str(k + 1) + "!\n")

    # backward path
    candidates = list([] for _ in range(k_max + 1))
    candidates[0] = sink
    skip = 0
    if not skip:
        for k in range(k_max):
            # find new candidates for backward path
            new_candidates = list()
            for sigs in candidates[k]:
                # do not look at the fanin of signals for which the proof already holds
                if k != 0:
                    if sigs not in proof_holds_backward[k - 1]:
                        new_candidates = new_candidates + E_pot_backward[sigs]
                else:
                    new_candidates = new_candidates + E_pot_backward[sigs]
            candidates[k + 1] = new_candidates
            # post-processing of list of possible backward candidates
            # make lists unique
            candidates[k + 1] = list(set(candidates[k + 1]))
            # remove sink from list
            for sig in sink:
                if sig in candidates[k + 1]:
                    candidates[k + 1].remove(sig)
            # if no new candidates were found in this iteration stop here
            candidates[k + 1].sort()
            if candidates[k + 1] == candidates[k]:
                print(
                    "No more new backward candidates can be found in cycle " + str(k + 1) + "!\n")
            # remove signals from earlier iterations, but only if they were already failing
            to_remove = list()
            if k != 0:
                for cand in candidates[k + 1]:
                    for i in range(k):
                        if cand in proof_fails_backward[i]:
                            to_remove.append(cand)
                for cand in to_remove:
                    candidates[k + 1].remove(cand)
            # print properties
            if candidates[k + 1]:
                filename = "Generated_Files/DiamondBlade_backward_cycle" + str(k + 1) + ".sva"
                open(filename, 'w').close()
                original_std_out = sys.stdout
                with open(filename, 'a') as file:
                    sys.stdout = file
                    # module declaration
                    module_decl = 'module DB_AIP_bw_cycle' + str(
                        k + 1) + '(' + config.clock_signal + ', ' + config.reset_signal + ');\n'
                    module_decl += 'input ' + config.clock_signal + ';\n'
                    module_decl += 'input ' + config.reset_signal + ';\n\n'

                    # include TiDAL
                    tidal_include = ''
                    tidal_include += '//System Verilog library for TiDAL\n'
                    tidal_include += '`include "tidal.sv"\n\n'
                    tidal_include += '//TiDAL properties must be enclosed within begin_tda and end_tda macros\n'
                    tidal_include += '`begin_tda(tda)\n'

                    tidal_end = '`end_tda'

                    # print input equivalence
                    input_equivalence = ''
                    # start of declaration
                    input_equivalence += 'function automatic input_equivalence_except_src();\n'
                    input_equivalence += '\tinput_equivalence_except_src = (\n'
                    # main body
                    i = 0
                    while i < len(input_signals):
                        if input_signals[i] not in source:
                            input_equivalence += '\t\t(DUV1.' + input_signals[i] + ' == DUV2.' + input_signals[i] + ')'
                            if i == len(input_signals) - 1:
                                input_equivalence += '\n'
                            else:
                                input_equivalence += ' &&\n'
                        i += 1
                    # end of declaration
                    input_equivalence += '\t);\n'
                    input_equivalence += 'endfunction\n\n'
                    print(module_decl)
                    print(standard_macros)
                    print(invariant_assumption_macro)
                    print(input_equivalence)

                    state_equivalence = ''
                    for cand in candidates[k + 1]:
                        sig = cand.replace('.', '$')
                        i = 0
                        j = 0
                        while i < len(state_signals):
                            # start of declaration
                            state_equivalence += 'function automatic state_equivalence_except_' + sig + str(j) + '();\n'
                            state_equivalence += '\tstate_equivalence_except_' + sig + str(j) + ' = (\n'
                            while i < len(state_signals) and (i == 1000 * j or i % 1000 != 0):
                                if state_signals[i] != cand:
                                    state_equivalence += '\t\t(DUV1.' + state_signals[i] + ' == DUV2.' + state_signals[
                                        i] + ')'
                                    if i == len(state_signals) - 1 or i == len(state_signals) - 2 and state_signals[
                                        len(state_signals) - 1] == cand or (i % (j * 1000 + 999)) == 0 and i != 0:
                                        state_equivalence += '\n'
                                    else:
                                        state_equivalence += ' &&\n'
                                i += 1
                            state_equivalence += '\t);\n'
                            state_equivalence += 'endfunction\n\n'
                            j += 1
                        # end of declaration
                        state_equivalence += 'function automatic state_equivalence_except_' + sig + '();\n'
                        state_equivalence += '\tstate_equivalence_except_' + sig + ' = (\n'
                        for tmp in range(j):
                            state_equivalence += '\t\tstate_equivalence_except_' + sig + str(tmp) + '()'
                            if tmp < j - 1:
                                state_equivalence += ' &&\n'
                            else:
                                state_equivalence += '\n'
                        state_equivalence += '\t);\n'
                        state_equivalence += 'endfunction\n\n'

                    print(state_equivalence)
                    print(tidal_include)
                sys.stdout = original_std_out

                for cand in candidates[k + 1]:
                    sink_is_state = sink in state_signals
                    printPropertyBackward(cand, k + 1, filename, sink, sink_is_state)

                bind_statement = '//Bind assertion module to DUV\n'
                bind_statement += 'bind miter DB_AIP_bw_cycle' + str(k + 1) + ' inst_DB_AIP_bw_cycle' + str(
                    k + 1) + '(.' + config.clock_signal + '(' + config.clock_signal + '), .' + config.reset_signal + '(' + config.reset_signal + '));\n'

                original_std_out = sys.stdout
                with open(filename, 'a') as file:
                    sys.stdout = file
                    print(tidal_end)
                    print(end_module)
                    print(bind_statement)
                sys.stdout = original_std_out

                # print number of candidates per cycle
                print(
                    "Number of backward candidates in cycle " + str(k + 1) + ": " + str(len(candidates[k + 1])) + "\n")
            else:
                print("No backward candidates found in cycle " + str(k + 1) + "!\n")
    print("Done!")
    return


def printPropertyForward(cand, k, filename):
    prop = ''

    sig = cand.replace('.', '$')
    sig = sig.replace('[', '$')
    sig = sig.replace(']', '$')

    # property part
    prop += 'property DiamondBlade_forward_' + sig + '_cycle' + str(k) + ';\n\n'
    prop += '\tduring_o(t, 0, t, ' + str(k) + ', blackboxing()) and\n'
    prop += '\tt ##0 state_equivalence_except_src() and\n'
    prop += '\tduring_o(t, 0, t, ' + str(k) + ', input_equivalence_except_src()) and\n'
    prop += '\tduring_o(t, 0, t, ' + str(k) + ', sw_env_global()) and\n'
    prop += '\tt ##0 sw_env_start()\n'

    prop += '\nimplies\n\n'

    prop += '\tt ##' + str(k) + ' ' + 'DUV1.' + cand + ' == DUV2.' + cand + ';\n\n'
    prop += 'endproperty\n\n'

    prop += 'DiamondBlade_forward_' + sig + '_cycle' + str(
        k) + 'prop: assert property (@(posedge ' + config.clock_signal + ') disable iff (' + config.reset_signal + '== ' + config.reset_value + ') DiamondBlade_forward_' + sig + '_cycle' + str(
        k) + ');\n'

    original_std_out = sys.stdout
    with open(filename, 'a') as file:
        sys.stdout = file
        print(prop)
    sys.stdout = original_std_out
    return


def printPropertyBackward(cand, k, filename, sink, sink_is_state):
    prop = ''

    sig = cand.replace('.', '$')
    sig = sig.replace('[', '$')
    sig = sig.replace(']', '$')

    # property part
    prop += 'property DiamondBlade_backward_' + sig + '_cycle' + str(k) + ';\n\n'
    prop += '\tduring_o(t, 0, t, ' + str(k) + ', blackboxing()) and\n'
    prop += '\tt ##0 state_equivalence_except_' + sig + '() and\n'

    if sink_is_state:
        prop += '\tduring_o(t, 0, t, ' + str(k) + ', input_equivalence_except_src()) and\n'
    else:
        prop += '\tduring_o(t, 0, t, ' + str(k - 1) + ', input_equivalence_except_src()) and\n'

    prop += '\tduring_o(t, 0, t, ' + str(k) + ', sw_env_global()) and\n'
    prop += '\tt ##0 sw_env_start()\n'

    prop += '\nimplies\n\n'

    if sink_is_state:
        prop += '\tt ##' + str(k) + ' ' + 'DUV1.' + sink[0] + ' == DUV2.' + sink[0] + ';\n\n'
    else:
        prop += '\tt ##' + str(k - 1) + ' ' + 'DUV1.' + sink[0] + ' == DUV2.' + sink[0] + ';\n\n'
    prop += 'endproperty\n\n'

    prop += 'DiamondBlade_backward_' + sig + '_cycle' + str(
        k) + 'prop: assert property (@(posedge ' + config.clock_signal + ') disable iff (' + config.reset_signal + '== ' + config.reset_value + ') DiamondBlade_backward_' + sig + '_cycle' + str(
        k) + ');\n'

    original_std_out = sys.stdout
    with open(filename, 'a') as file:
        sys.stdout = file
        print(prop)
    sys.stdout = original_std_out
    return


class IO_info:
    def __init__(self, name, direction, signal_type):
        self.name = name
        self.direction = direction
        self.type = signal_type


def printMiter(filename, top_name):
    # read miter info file and create list of primary IO signals
    IO_list = []
    with open(filename) as f:
        for line in f:
            line_list = line.replace("\n", "").split(' ')
            io = IO_info(line_list[0], line_list[1], line_list[2])
            IO_list.append(io)
    # create miter.sva file
    # start of declaration
    miter_str = 'module miter (\n'
    # miter IO declaration
    for IO in IO_list:
        if IO.name == "clk" or IO.name == "clock" or IO.name == config.clock_signal or IO.name == "reset_n" or IO.name == "rst" or IO.name == "reset" or IO.name == config.reset_signal:
            miter_str += '\t' + IO.direction + ' ' + IO.type + ' ' + IO.name.replace(".", "_")
        else:
            miter_str += '\t' + IO.direction + ' ' + IO.type + ' ' + IO.name.replace(".", "_") + '_1,\n'
            miter_str += '\t' + IO.direction + ' ' + IO.type + ' ' + IO.name.replace(".", "_") + '_2'

        if IO_list.index(IO) != len(IO_list) - 1:
            miter_str += ',\n'
        else:
            miter_str += '\n'
    miter_str += ');\n\n'
    # instantiation of DUV1 and DUV2
    miter_str += '\t' + top_name + ' DUV1(\n'
    for IO in IO_list:
        if IO.name == "clk" or IO.name == "clock" or IO.name == config.clock_signal or IO.name == "reset_n" or IO.name == "rst" or IO.name == "reset" or IO.name == config.reset_signal:
            miter_str += '\t\t.' + IO.name + '(' + IO.name.replace(".", "_") + ')'
        else:
            miter_str += '\t\t.' + IO.name + '(' + IO.name.replace(".", "_") + '_1)'
        if IO_list.index(IO) != len(IO_list) - 1:
            miter_str += ',\n'
        else:
            miter_str += '\n'
    miter_str += '\t);\n\n'

    miter_str += '\t' + top_name + ' DUV2(\n'
    for IO in IO_list:
        if IO.name == "clk" or IO.name == "clock" or IO.name == config.clock_signal or IO.name == "reset_n" or IO.name == "rst" or IO.name == "reset" or IO.name == config.reset_signal:
            miter_str += '\t\t.' + IO.name + '(' + IO.name.replace(".", "_") + ')'
        else:
            miter_str += '\t\t.' + IO.name + '(' + IO.name.replace(".", "_") + '_2)'
        if IO_list.index(IO) != len(IO_list) - 1:
            miter_str += ',\n'
        else:
            miter_str += '\n'
    miter_str += '\t);\n\n'

    # end of declaration
    miter_str += 'endmodule'

    # print to file
    original_std_out = sys.stdout
    with open("Generated_Files/miter.sv", 'w') as file:
        sys.stdout = file
        print(miter_str)
    sys.stdout = original_std_out
    return


def printStep(proof_fails_forward, source, state_signals, input_signals, E_pot):
    V_aff_f = list()
    for list_of_nodes in proof_fails_forward:
        for node in list_of_nodes:
            V_aff_f.append(node)
    for node in source:
        V_aff_f.append(node)

    # print properties
    if set(V_aff_f) != set(source):
        filename = "Generated_Files/DiamondBlade_Step.sva"
        open(filename, 'w').close()
        original_std_out = sys.stdout
        with open(filename, 'a') as file:
            sys.stdout = file
            # module declaration
            module_decl = 'module DB_AIP_Step(' + config.clock_signal + ', ' + config.reset_signal + ');\n'
            module_decl += 'input ' + config.clock_signal + ';\n'
            module_decl += 'input ' + config.reset_signal + ';\n\n'

            # blackboxing, sw_env and invariants functions
            standard_macros = read_file(config.standard_macros_path)
            if standard_macros == "":
                sys.exit("Error: Could not read standard macros file.")

            # invariant assumption macro
            invariant_assumption_macro = 'invariant_assumption: assume property(@(posedge ' + config.clock_signal + ') disable iff(' + config.reset_signal + '== ' + config.reset_value + ') invariants());\n\n'

            # include TiDAL
            tidal_include = ''
            tidal_include += '//System Verilog library for TiDAL\n'
            tidal_include += '`include "tidal.sv"\n\n'
            tidal_include += '//TiDAL properties must be enclosed within begin_tda and end_tda macros\n'
            tidal_include += '`begin_tda(tda)\n'

            tidal_end = '`end_tda'

            # print input equivalence
            input_equivalence = ''
            # start of declaration
            input_equivalence += 'function automatic input_equivalence_except_src();\n'
            input_equivalence += '\tinput_equivalence_except_src = (\n'
            # main body
            i = 0
            while i < len(input_signals):
                if input_signals[i] not in source:
                    input_equivalence += '\t\t(DUV1.' + input_signals[i] + ' == DUV2.' + input_signals[i] + ')'
                    if i == len(input_signals) - 1:
                        input_equivalence += '\n'
                    else:
                        input_equivalence += ' &&\n'
                i += 1
            # end of declaration
            input_equivalence += '\t);\n'
            input_equivalence += 'endfunction\n\n'
            print(module_decl)
            # print(dummy_macros)
            print(input_equivalence)

            # state_equivalence_except_src part
            state_equivalence = ''

            i = 0
            j = 0
            while i < len(state_signals):
                # start of declaration
                state_equivalence += 'function automatic state_equivalence_step_' + str(j) + '();\n'
                state_equivalence += '\tstate_equivalence_step_' + str(j) + ' = (\n'
                while i < len(state_signals) and (i == 1000 * j or i % 1000 != 0):
                    if state_signals[i] not in V_aff_f:
                        state_equivalence += '\t\t(DUV1.' + state_signals[i] + ' == DUV2.' + state_signals[i] + ')'
                        if i == len(state_signals) - 1 or i == len(state_signals) - 2 and state_signals[
                            len(state_signals) - 1] in V_aff_f or (i % (j * 1000 + 999)) == 0 and i != 0:
                            state_equivalence += '\n'
                        else:
                            state_equivalence += ' &&\n'
                    i += 1
                state_equivalence += '\t);\n'
                state_equivalence += 'endfunction\n\n'
                j += 1
            # end of declaration
            state_equivalence += 'function automatic state_equivalence_step();\n'
            state_equivalence += '\tstate_equivalence_step = (\n'
            for tmp in range(j):
                state_equivalence += '\t\tstate_equivalence_step_' + str(tmp) + '()'
                if tmp < j - 1:
                    state_equivalence += ' &&\n'
                else:
                    state_equivalence += '\n'
            state_equivalence += '\t);\n'
            state_equivalence += 'endfunction\n\n'
            print(state_equivalence)

            # V_step macro
            V_Step_macro = ''
            V_Step_macro += 'function automatic V_step_equivalence();\n'
            V_Step_macro += '\tV_step_equivalence = (\n'
            candidates_step = list()
            for node in V_aff_f:
                if E_pot.get(node) is not None:
                    for v_s in E_pot[node]:
                        if v_s not in V_aff_f:
                            candidates_step.append(v_s)
            i = 0
            candidates_step = list(set(candidates_step))
            while i < len(candidates_step):
                V_Step_macro += '\t\t(DUV1.' + candidates_step[i] + ' == DUV2.' + candidates_step[i] + ')'
                if i == len(candidates_step) - 1:
                    V_Step_macro += '\n'
                else:
                    V_Step_macro += ' &&\n'
                i += 1
            # end of declaration
            V_Step_macro += '\t);\n'
            V_Step_macro += 'endfunction\n\n'
            print(V_Step_macro)
            print(standard_macros)
            print(invariant_assumption_macro)
            print(tidal_include)

            # step property
            prop = ''

            # property part
            prop += 'property DiamondBlade_Step;\n\n'
            prop += '\tduring_o(t, 0, t, 2, blackboxing()) and\n'
            prop += '\tduring_o(t, 0, t, 1, state_equivalence_step()) and\n'
            prop += '\tduring_o(t, 0, t, 2, input_equivalence_except_src()) and\n'
            prop += '\tduring_o(t, 0, t, 2, sw_env_global()) and\n'
            prop += '\tt ##0 sw_env_start()\n'

            prop += '\nimplies\n\n'

            prop += '\tt ##2 V_step_equivalence();\n\n'
            prop += 'endproperty\n\n'

            prop += 'DiamondBlade_Step_prop: assert property (@(posedge ' + config.clock_signal + ') disable iff (' + config.reset_signal + '== ' + config.reset_value + ') DiamondBlade_Step);\n'
            print(prop)

            print(tidal_end)

            end_module = 'endmodule\n\n'
            print(end_module)

            bind_statement = '//Bind assertion module to DUV\n'
            bind_statement += 'bind miter DB_AIP_Step inst_DB_AIP_Step(.' + config.clock_signal + '(' + config.clock_signal + '), .' + config.reset_signal + '(' + config.reset_signal + '));\n'
            print(bind_statement)

        sys.stdout = original_std_out
    else:
        print("No properties to print in Step module!")
    print("Done!")
    return


def addAffectableNode(proof_fails_forward, node):
    proof_fails_forward.append(node)
    return proof_fails_forward


HELP_TEXT = "List of commands:" \
            "\n\thelp: Display this text." \
            "\n\texit: Quit the DiamondBlade Python Tool." \
            "\n\tsetup: Main function of the tool. Uses information from the config file to prune the design, to generate the miter and to generate forward, backward and intersection properties." \
            "\n\tprintStep: Prints the step property based on the previous results." \
            "\n\taddAffNode: Adds a signal obtained from a previous true counterexample of the step property to the set of affectable nodes. Re-run printStep afterwards." \
            "\n\tgetCutSignals: Generate a list of all signals of the DUV that can be pruned to remove them with OneSpin and print the cutSigEquivalence."
