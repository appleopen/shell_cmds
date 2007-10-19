Project = shell_cmds

Embedded=$(shell tconf --test TARGET_OS_EMBEDDED)

SubProjects = alias apply basename chroot date dirname echo env expr false \
        find getopt hostname id jot kill killall lastcomm locate logname mktemp \
        nice nohup printenv printf pwd renice script shlock sleep \
        tee test time true uname users w whereis which who xargs yes

ifeq ($(Embedded),NO)
# su requires PAM
SubProjects += su
endif

MANPAGES = Manpages/builtin.1

include $(MAKEFILEPATH)/CoreOS/ReleaseControl/BSDCommon.make

BUILTIN_LINKS = alias.1 \
	alloc.1 \
	bg.1 \
	bind.1 \
	bindkey.1 \
	break.1 \
	breaksw.1 \
	builtins.1 \
	case.1 \
	cd.1 \
	chdir.1 \
	command.1 \
	complete.1 \
	continue.1 \
	default.1 \
	dirs.1 \
	do.1 \
	done.1 \
	echotc.1 \
	elif.1 \
	else.1 \
	end.1 \
	endif.1 \
	endsw.1 \
	esac.1 \
	eval.1 \
	exec.1 \
	exit.1 \
	export.1 \
	fc.1 \
	fg.1 \
	fi.1 \
	filetest.1 \
	for.1 \
	foreach.1 \
	getopts.1 \
	glob.1 \
	goto.1 \
	hash.1 \
	hashstat.1 \
	history.1 \
	hup.1 \
	if.1 \
	jobid.1 \
	jobs.1 \
	limit.1 \
	log.1 \
	logout.1 \
	ls-F.1 \
	notify.1 \
	onintr.1 \
	popd.1 \
	pushd.1 \
	read.1 \
	readonly.1 \
	rehash.1 \
	repeat.1 \
	return.1 \
	sched.1 \
	set.1 \
	setenv.1 \
	settc.1 \
	setty.1 \
	setvar.1 \
	shift.1 \
	source.1 \
	stop.1 \
	suspend.1 \
	switch.1 \
	telltc.1 \
	then.1 \
	times.1 \
	trap.1 \
	type.1 \
	ulimit.1 \
	umask.1 \
	unalias.1 \
	uncomplete.1 \
	unhash.1 \
	unlimit.1 \
	unset.1 \
	unsetenv.1 \
	until.1 \
	wait.1 \
	where.1 \
	while.1

after_install:
	@echo Installing manpage links...
	@for manpage in $(BUILTIN_LINKS); do \
		$(LN) -f $(DSTROOT)/usr/share/man/man1/builtin.1 $(DSTROOT)/usr/share/man/man1/$${manpage}; \
	done
