set sig_list [list top.cellstate_tb.nbr\[7:0\] top.cellstate_tb.cell top.cellstate_tb.change]
gtkwave::addSignalsFromList $sig_list
gtkwave::highlightSignalsFromList "top.cellstate_tb.nbr\[7:0\]"
gtkwave::/Edit/Data_Format/Binary