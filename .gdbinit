set history save on
set history size 100000
set history filename ~/.gdb_history
set charset ASCII
set max-completions 400
set follow-fork-mode parent
#set auto-load local-gdbinit

source ~/tools/pwn/pwndbg/gdbinit.py
set auto-save-search on

source ~/tools/pwn/splitmind/gdbinit.py

python
import os

def create_pane_by_splitmind():
	import splitmind
	(splitmind.Mind()
		.right(display="disasm", size="50%")
		.above(of="main",display="regs",size="30%")
		.below(of="main",display="stack",size="50%")
		.below(display="backtrace",size="40%")
		.show("legend", on="stack")
	).build(nobanner=True)
	gdb.execute("set context-code-lines 50")

if os.getenv("TMUX"):
	create_pane_by_splitmind()
end
