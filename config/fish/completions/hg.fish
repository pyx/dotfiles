# Completions for the hg command
# with my addtions, intended to replace the default hg completions that comes
# with fish.

# Completions for the 'add' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a add --description 'Add the specified files on the next commit'
# add option completion
__hg_complete add -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete add -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete add -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete add -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete add -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete add -a '(hg_list_unknown_files "File to add")' -x

# Completions for the 'addremove' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a addremove --description 'Add all new files and remove all missing files from the repository'
# add option completion
__hg_complete addremove -d 'Guess renamed files by similarity [0, 100]' -s s -l similarity -x
__hg_complete addremove -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete addremove -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete addremove -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete addremove -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete addremove -a '(hg_list_unknown_files "File to add")' -x
__hg_complete addremove -a '(hg_list_deleted_files "File deletion to be recorded")' -x

# Completions for the 'annotate' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a annotate --description 'Show changeset information per file line'
# add option completion
__hg_complete annotate -d 'Annotate the specified revision' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete annotate -d 'Do not follow copies and renames' -l no-follow
__hg_complete annotate -d 'Treat all files as text' -s a -l text
__hg_complete annotate -d 'List the author (long with -v)' -s u -l user
__hg_complete annotate -d 'List the filename' -s f -l file
__hg_complete annotate -d 'List the date (short with -q)' -s d -l date
__hg_complete annotate -d 'List the revision number (default)' -s n -l number
__hg_complete annotate -d 'List the changeset' -s c -l changeset
__hg_complete annotate -d 'Show line number at the first appearance' -s l -l line-number
__hg_complete annotate -d 'Ignore white space when comparing lines' -s w -l ignore-all-space
__hg_complete annotate -d 'Ignore changes in the amount of white space' -s b -l ignore-space-change
__hg_complete annotate -d 'Ignore changes whose lines are all blank' -s B -l ignore-blank-lines
__hg_complete annotate -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete annotate -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete annotate -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete annotate -a '(hg_list_tracked_files "File to annotate")' -x
# add alias
__hg_subcommand_alias blame annotate

# Completions for the 'archive' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a archive --description 'Create unversioned archive of a repository revision'
# add option completion
__hg_complete archive -d 'Do not pass files through decoders' -l no-decode
__hg_complete archive -d 'Directory prefix for files in archive' -s p -l prefix -x
__hg_complete archive -d 'Revision to distribute' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete archive -d 'Type of distribution to create' -a '(hg_list_archive_types)' -s t -l type -x
__hg_complete archive -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete archive -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete archive -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete archive -d 'Operate on patch repository' -l mq

# Completions for the 'backout' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a backout --description 'Reverse effect of earlier changeset'
# add option completion
__hg_complete backout -d 'Merge with old dirstate parent after backout' -l merge -x
__hg_complete backout -d 'Revision to backout' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete backout -d 'Specify merge tool' -s t -l tool -x
__hg_complete backout -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete backout -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete backout -d 'Use <text> as commit message' -s m -l message -x
__hg_complete backout -d 'Read commit message from <file>' -s l -l logfile -x
__hg_complete backout -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete backout -d 'Record the specified user as committer' -s u -l user -x
__hg_complete backout -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete backout -a '(hg_list_all_changesets)' -x

# Completions for the 'bisect' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a bisect --description 'Subdivision search of changesets'
# add option completion
__hg_complete bisect -d 'Reset bisect state' -s r -l reset
__hg_complete bisect -d 'Mark changeset good' -s g -l good
__hg_complete bisect -d 'Mark changeset bad' -s b -l bad
__hg_complete bisect -d 'Skip testing changeset' -s s -l skip
__hg_complete bisect -d 'Extend the bisect range' -s e -l extend
__hg_complete bisect -d 'Use command to check changeset state' -s c -l command -x
__hg_complete bisect -d 'Do not update to target' -s U -l noupdate
__hg_complete bisect -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete bisect -a '(hg_list_all_changesets)' -x

# Completions for the 'bookmarks' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a bookmarks --description 'Track a line of development with movable markers'
# add option completion
__hg_complete bookmarks -d 'Run even when bookmark already exists' -s f -l force
__hg_complete bookmarks -d 'Revision to be bookmarked' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete bookmarks -d 'Delete a given bookmark' -a '(hg_list_bookmarks "Bookmark to delete")' -s d -l delete -x
__hg_complete bookmarks -d 'Rename a given bookmark' -a '(hg_list_bookmarks "Bookmark to rename")' -s m -l rename -x
__hg_complete bookmarks -d 'Mark a bookmark inactive' -s i -l inactive
__hg_complete bookmarks -d 'Operate on patch repository' -l mq

# Completions for the 'branch' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a branch --description 'Set or show the current branch name'
# add option completion
__hg_complete branch -d 'Set branch name even if it shadows an existing branch' -s f -l force
__hg_complete branch -d 'Reset branch name to parent branch name' -s C -l clean
__hg_complete branch -d 'Operate on patch repository' -l mq

# Completions for the 'branches' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a branches --description 'List repository named branches'
# add option completion
__hg_complete branches -d 'Show only branches that have unmerged heads' -s a -l active
__hg_complete branches -d 'Show normal and closed branches' -s c -l closed
__hg_complete branches -d 'Operate on patch repository' -l mq

# Completions for the 'bundle' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a bundle --description 'Create a changegroup file'
# add option completion
__hg_complete bundle -d 'Run even when remote repository is unrelated' -s f -l force
__hg_complete bundle -d 'Revision to bundle' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete bundle -d 'A specific branch you would like to bundle' -a '(hg_list_branches "Branch to bundle")' -s b -l branch -x
__hg_complete bundle -d 'A base changeset assumed to be available at the destination' -a '(hg_list_all_changesets)' -l base -x
__hg_complete bundle -d 'Bundle all changesets in the repository' -s a -l all
__hg_complete bundle -d 'Compression type to use' -a '(hg_list_compression_types)' -s t -l type -x
__hg_complete bundle -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete bundle -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete bundle -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete bundle -d 'Operate on patch repository' -l mq

# Completions for the 'cat' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a cat --description 'Output the latest or given revisions of files'
# add option completion
__hg_complete cat -d 'Print output to file with formatted name' -s o -l output -x
__hg_complete cat -d 'Print the given revision' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete cat -d 'Apply any matching decode filter' -l decode
__hg_complete cat -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete cat -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete cat -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete cat -a '(hg_list_tracked_files "File to print")' -x

# Completions for the 'clone' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a clone --description 'Make a copy of an existing repository'
# add option completion
__hg_complete clone -d 'The clone will include an empty working copy (only a repository)' -s U -l noupdate
# only works when inside SOURCE repository
__hg_complete clone -d 'A changeset you would like to have after cloning' -a '(hg_list_all_changesets)' -s u -l updaterev -x
__hg_complete clone -d 'Include the specified changeset' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete clone -d 'Clone only the specified branch' -a '(hg_list_branches "Branch to clone")' -s b -l branch -x
__hg_complete clone -d 'Use pull protocol to copy metadata' -l pull
__hg_complete clone -d 'Use uncompressed transfer (fast over LAN)' -l uncompressed
__hg_complete clone -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete clone -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete clone -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
# add path completion
__hg_complete clone -a '(__fish_complete_directories "" "Directory to clone")' -x

# Completions for the 'commit' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a commit --description 'Commit the specified files or all outstanding changes'
# add option completion
__hg_complete commit -d 'Mark new/missing files as added/removed before committing' -s A -l addremove
__hg_complete commit -d 'Mark a branch as closed, hiding it from the branch list' -a '(hg_list_branches "Branch to close")' -l close-branch -x
__hg_complete commit -d 'Amend the parent of the working dir' -l amend
__hg_complete commit -d 'Use the secret phase for committing' -s s -l secret
__hg_complete commit -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete commit -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete commit -d 'Use <text> as commit message' -s m -l message -x
__hg_complete commit -d 'Read commit message from <file>' -s l -l logfile -x
__hg_complete commit -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete commit -d 'Record the specified user as committer' -s u -l user -x
__hg_complete commit -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete commit -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete commit -a '(hg_list_added_files)' -x
__hg_complete commit -a '(hg_list_modified_files)' -x
__hg_complete commit -a '(hg_list_removed_files)' -x
# add alias
__hg_subcommand_alias ci commit

# Completions for the 'copy' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a copy --description 'Mark files as copied for the next commit'
# add option completion
__hg_complete copy -d 'Record a copy that has already occurred' -s A -l after
__hg_complete copy -d 'Forcibly copy over an existing managed file' -s f -l force
__hg_complete copy -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete copy -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete copy -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete copy -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete copy -a '(hg_list_tracked_files "File to copy")' -x
# add alias
__hg_subcommand_alias cp copy

# Completions for the 'diff' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a diff --description 'Diff repository (or selected files)'
# add option completion
__hg_complete diff -d 'Revision to compare' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete diff -d 'Change made by revision' -a '(hg_list_all_changesets)' -s c -l change -x
__hg_complete diff -d 'Treat all files as text' -s a -l text
__hg_complete diff -d 'Use git extended diff format' -s g -l git
__hg_complete diff -d 'Omit dates from diff headers' -l nodates
__hg_complete diff -d 'Show which function each change is in' -s p -l show-function
__hg_complete diff -d 'Produce a diff that undoes the changes' -l reverse
__hg_complete diff -d 'Ignore white space when comparing lines' -s w -l ignore-all-space
__hg_complete diff -d 'Ignore changes in the amount of white space' -s b -l ignore-space-change
__hg_complete diff -d 'Ignore changes whose lines are all blank' -s B -l ignore-blank-lines
__hg_complete diff -d 'Number of lines of context to show' -s U -l unified -x
__hg_complete diff -d 'Output diffstat-style summary of changes' -l stat
__hg_complete diff -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete diff -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete diff -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete diff -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete diff -a '(hg_list_tracked_files "File to compare")' -x

# Completions for the 'export' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a export --description 'Dump the header and diffs for one or more changesets'
# add option completion
__hg_complete export -d 'Print output to file with formatted name' -s o -l output -x
__hg_complete export -d 'Diff against the second parent' -l switch-parent
__hg_complete export -d 'Revision to export' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete export -d 'Treat all files as text' -s a -l text
__hg_complete export -d 'Use git extended diff format' -s g -l git
__hg_complete export -d 'Omit dates from diff headers' -l nodates
__hg_complete export -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete export -a '(hg_list_all_changesets)' -x

# Completions for the 'forget' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a forget --description 'Forget the specified files on the next commit'
# add option completion
__hg_complete forget -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete forget -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete forget -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete forget -a '(hg_list_tracked_files "File to forget")' -x
__hg_complete forget -a '(hg_list_added_files "Pending file addition")' -x

# Completions for the 'graft' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a graft --description 'Copy changes from other branches onto the current branch'
set -l __graft_revset '(hg_list_revs "all() - ancestors(parents()) - descendants(parents())")'
# add option completion
__hg_complete graft -d 'Revision to graft' -a $__graft_revset -s r -l rev -x
__hg_complete graft -d 'Resume interrupted graft' -s c -l continue
__hg_complete graft -d 'Invoke editor on commit messages' -s e -l edit
__hg_complete graft -d 'Append graft info to log message' -l log
__hg_complete graft -d 'Record the current date as commit date' -s D -l currentdate
__hg_complete graft -d 'Record the current user as committer' -s U -l currentuser
__hg_complete graft -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete graft -d 'Record the specified user as committer' -s u -l user -x
__hg_complete graft -d 'Specify merge tool' -s t -l tool -x
__hg_complete graft -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete graft -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete graft -a $__graft_revset -x

# Completions for the 'grep' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a grep --description 'Search for a pattern in specified files and revisions'
# add option completion
__hg_complete grep -d 'End fields with NUL' -s 0 -l print0
__hg_complete grep -d 'Print all revisions that match' -l all
__hg_complete grep -d 'Treat all files as text' -s a -l text
__hg_complete grep -d 'Follow changeset history, or file history across copies and renames' -s f -l follow
__hg_complete grep -d 'Ignore case when matching' -s i -l ignore-case
__hg_complete grep -d 'Print only filenames and revs that match' -s l -l files-with-matches
__hg_complete grep -d 'Print matching line numbers' -s n -l line-number
__hg_complete grep -d 'Only search files changed within revision range' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete grep -d 'List the author (long with -v)' -s u -l user
__hg_complete grep -d 'List the date (short with -q)' -s d -l date
__hg_complete grep -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete grep -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete grep -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete grep -a '(hg_list_tracked_files "File to search")' -x

# Completions for the 'heads' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a heads --description 'Show current repository heads'
# add option completion
__hg_complete heads -d 'Show only heads which are descendants of rev' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete heads -d 'Show topological heads only' -s t -l topo
__hg_complete heads -d 'Show normal and closed branch heads' -s c -l closed
__hg_complete heads -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete heads -d 'Display with template' -l template -x
__hg_complete heads -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete heads -a '(hg_list_all_changesets)' -x

# Completions for the 'help' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a help --description 'Show help for a command, extension, or list of commands'
# add option completion
__hg_complete help -d 'Show only help for extensions' -s e -l extension
__hg_complete help -d 'Show only help for commands' -s c -l command
__hg_complete help -d 'Show topics matching keyword' -s k -l keyword -x
# add help topic
__hg_complete help -a '(hg_list_help_topics)' -x

# Completions for the 'identify' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a identify --description 'Print information about the working copy'
# add option completion
__hg_complete identify -d 'Identify the specified revision' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete identify -d 'Show local revision number' -s n -l num
__hg_complete identify -d 'Show global revision id' -s i -l id
__hg_complete identify -d 'Show branch' -s b -l branch
__hg_complete identify -d 'Show tags' -s t -l tags
__hg_complete identify -d 'Show bookmarks' -s B -l bookmarks
__hg_complete identify -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete identify -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete identify -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete identify -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete identify -a '(hg_list_paths)' -x

# Completions for the 'import' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a import --description 'Import an ordered set of patches'
# add option completion
__hg_complete import -d 'Directory strip option for patch (default: 1)' -s p -l strip -x
__hg_complete import -d 'Invoke editor on commit messages' -s e -l edit
__hg_complete import -d 'Skip check for outstanding uncommitted changes' -s f -l force
__hg_complete import -d 'Do not commit. Just update the working directory' -l no-commit
__hg_complete import -d 'Apply patch without touching the working directory' -l bypass
__hg_complete import -d 'Apply patch to the nodes from which it was generated' -l exact
__hg_complete import -d 'use any branch information in patch (implied by --exact)' -l import-branch
__hg_complete import -d 'Use <text> as commit message' -s m -l message -x
__hg_complete import -d 'Read commit message from <file>' -s l -l logfile -x
__hg_complete import -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete import -d 'Record the specified user as committer' -s u -l user -x
__hg_complete import -d 'Guess renamed files by similarity [0, 100]' -s s -l similarity -x
__hg_complete import -d 'Operate on patch repository' -l mq
# add alias
__hg_subcommand_alias patch import

# Completions for the 'incoming' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a incoming --description 'Show new changesets found in source'
# add option completion
__hg_complete incoming -d 'Run even when remote repository is unrelated' -s f -l force
__hg_complete incoming -d 'Show newest record first' -s n -l newest-first
__hg_complete incoming -d 'File to store the bundles into' -l bundle -x
__hg_complete incoming -d 'A remote changeset intended to be added' -s r -l rev -x
__hg_complete incoming -d 'Compare bookmarks' -s B -l bookmarks
__hg_complete incoming -d 'A specific branch you would like to pull' -s b -l branch -x
__hg_complete incoming -d 'Show patch' -s p -l patch
__hg_complete incoming -d 'Use git extended diff format' -s g -l git
__hg_complete incoming -d 'Limit number of changes displayed' -s l -l limit -x
__hg_complete incoming -d 'Do not show merges' -s M -l no-merges
__hg_complete incoming -d 'Output diffstat-style summary of changes' -l stat
__hg_complete incoming -d 'Show the revision DAG' -s G -l graph
__hg_complete incoming -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete incoming -d 'Display with template' -l template -x
__hg_complete incoming -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete incoming -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete incoming -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete incoming -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete incoming -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete incoming -a '(hg_list_paths)' -x

# Completions for the 'init' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a init --description 'Create a new repository in the given directory'
# add option completion
__hg_complete init -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete init -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete init -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete init -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete init -a '(__fish_complete_directories "" "Directory to initialize")' -x

# Completions for the 'locate' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a locate --description 'Locate files matching specific patterns'
# add option completion
__hg_complete locate -d 'Search the repository as it stood at rev' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete locate -d 'End filenames with NUL, for use with xargs' -s 0 -l print0
__hg_complete locate -d 'Print complete paths from the filesystem root' -s f -l fullpath
__hg_complete locate -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete locate -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete locate -d 'Operate on patch repository' -l mq

# Completions for the 'log' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a log --description 'Show revision history of entire repository or files'
# add option completion
__hg_complete log -d 'Follow changeset history, or file history across copies and renames' -s f -l follow
__hg_complete log -d 'Show revisions matching date spec' -s d -l date -x
__hg_complete log -d 'Show copied files' -s C -l copies
__hg_complete log -d 'Do case-insensitive search for a given text' -s k -l keyword -x
__hg_complete log -d 'Show the specified revision or range' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete log -d 'Include revisions where files were removed' -l removed
__hg_complete log -d 'Revisions committed by user' -a '(hg_list_authors)' -s u -l user -x
__hg_complete log -d 'Show changesets within the given named branch' -a '(hg_list_branches "Branch to show")' -s b -l branch -x
__hg_complete log -d 'Do not display revision or any of its ancestors' -a '(hg_list_all_changesets)' -s P -l prune -x
__hg_complete log -d 'Show patch' -s p -l patch
__hg_complete log -d 'Use git extended diff format' -s g -l git
__hg_complete log -d 'Limit number of changes displayed' -s l -l limit -x
__hg_complete log -d 'Do not show merges' -s M -l no-merges
__hg_complete log -d 'Output diffstat-style summary of changes' -l stat
__hg_complete log -d 'Show the revision DAG' -s G -l graph
__hg_complete log -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete log -d 'Display with template' -l template -x
__hg_complete log -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete log -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete log -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete log -a '(hg_list_tracked_files)' -x

# Completions for the 'manifest' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a manifest --description 'Output the latest or given revision of the project manifest'
# add option completion
__hg_complete manifest -d 'Revision to display' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete manifest -d 'List files from all revisions' -l all

# Completions for the 'merge' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a merge --description 'Merge working directory with another revision'
set -l __merge_revset '(hg_list_revs "not ancestors(.)")'
# add option completion
__hg_complete merge -d 'Force a merge with outstanding changes' -s f -l force
__hg_complete merge -d 'Revision to merge' -a $__merge_revset -s r -l rev -x
__hg_complete merge -d 'Review revisions to merge (no merge is performed)' -s P -l preview
__hg_complete merge -d 'Specify merge tool' -s t -l tool -x
__hg_complete merge -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete merge -a $__merge_revset -x

# Completions for the 'outgoing' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a outgoing --description 'Show changesets not found in destination'
# add option completion
__hg_complete outgoing -d 'Run even when remote repository is unrelated' -s f -l force
__hg_complete outgoing -d 'A changeset intended to be included in the destination' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete outgoing -d 'Show newest record first' -s n -l newest-first
__hg_complete outgoing -d 'Compare bookmarks' -s B -l bookmarks
__hg_complete outgoing -d 'A specific branch you would like to push' -a '(hg_list_branches "Branch to push")' -s b -l branch -x
__hg_complete outgoing -d 'Show patch' -s p -l patch
__hg_complete outgoing -d 'Use git extended diff format' -s g -l git
__hg_complete outgoing -d 'Limit number of changes displayed' -s l -l limit -x
__hg_complete outgoing -d 'Do not show merges' -s M -l no-merges
__hg_complete outgoing -d 'Output diffstat-style summary of changes' -l stat
__hg_complete outgoing -d 'Show the revision DAG' -s G -l graph
__hg_complete outgoing -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete outgoing -d 'Display with template' -l template -x
__hg_complete outgoing -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete outgoing -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete outgoing -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete outgoing -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete outgoing -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete outgoing -a '(hg_list_paths)' -x

# Completions for the 'parents' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a parents --description 'Show the parents of the working dir or revision'
# add option completion
__hg_complete parents -d 'Show parents from the specified rev' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete parents -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete parents -d 'Display with template' -l template -x
__hg_complete parents -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete parents -a '(hg_list_tracked_files "File last changed")' -x

# Completions for the 'paths' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a paths --description 'Show definition of symbolic path names'
# add option completion
__hg_complete paths -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete paths -a '(hg_list_paths)' -x

# Completions for the 'phase' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a phase --description 'Set or show the current phase name'
# add option completion
__hg_complete phase -d 'Set changeset phase to public' -s p -l public
__hg_complete phase -d 'Set changeset phase to draft' -s d -l draft
__hg_complete phase -d 'Set changeset phase to secret' -s s -l secret
__hg_complete phase -d 'Allow to move boundary backward' -s f -l force
__hg_complete phase -d 'Target revision' -a '(hg_list_all_changesets)' -s r -l rev -x
# add revision completion
__hg_complete phase -a '(hg_list_all_changesets)' -x

# Completions for the 'pull' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a pull --description 'Pull changes from the specified source'
# add option completion
__hg_complete pull -d 'Update the working directory to tip after pull' -s u -l update
__hg_complete pull -d 'Run even when remote repository is unrelated' -s f -l force
__hg_complete pull -d 'A remote changeset intended to be added' -s r -l rev -x
__hg_complete pull -d 'Bookmark to pull' -s B -l bookmark -x
__hg_complete pull -d 'A specific branch you would like to pull' -s b -l branch -x
__hg_complete pull -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete pull -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete pull -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete pull -d 'Rebase working directory to branch head' -l rebase
__hg_complete pull -d 'Specify merge tool for revase' -s t -l tool -x
__hg_complete pull -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete pull -a '(hg_list_paths)' -x

# Completions for the 'push' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a push --description 'Push changes to the specified destination'
# add option completion
__hg_complete push -d 'Force push' -s f -l force
__hg_complete push -d 'A changeset intended to be included in the destination' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete push -d 'Bookmark to push' -a '(hg_list_bookmarks "Bookmark to push")' -s B -l bookmark -x
__hg_complete push -d 'A specific branch you would like to push' -a '(hg_list_branches "Branch to push")' -s b -l branch -x
__hg_complete push -d 'Allow pushing a new branch' -l new-branch
__hg_complete push -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete push -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete push -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete push -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete push -a '(hg_list_paths)' -x

# Completions for the 'recover' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a recover --description 'Roll back an interrupted transaction'
# add option completion
__hg_complete recover -d 'Operate on patch repository' -l mq

# Completions for the 'remove' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a remove --description 'Remove the specified files on the next commit'
# add option completion
__hg_complete remove -d 'Record remove that has already occurred' -s A -l after
__hg_complete remove -d 'Remove file even if modified' -s f -l force
__hg_complete remove -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete remove -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete remove -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete remove -a '(hg_list_tracked_files "File to remove")' -x
# add alias
__hg_subcommand_alias rm remove

# Completions for the 'rename' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a rename --description 'Rename files; equivalent of copy + remove'
# add option completion
__hg_complete rename -d 'Record a rename that has already occurred' -s A -l after
__hg_complete rename -d 'Forcibly copy over an existing managed file' -s f -l force
__hg_complete rename -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete rename -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete rename -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete rename -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete rename -a '(hg_list_tracked_files "File to rename")' -x
# add alias
__hg_subcommand_alias move rename
__hg_subcommand_alias mv rename

# Completions for the 'resolve' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a resolve --description 'Redo merges or set/view the merge status of files'
# add option completion
__hg_complete resolve -d 'Select all unresolved files' -s a -l all
__hg_complete resolve -d 'List state of files needing merge' -s a -l all
__hg_complete resolve -d 'Mark files as resolved' -s m -l mark
__hg_complete resolve -d 'Mark files as unresolved' -s u -l unmark
__hg_complete resolve -d 'Hide status prefix' -s n -l no-status
__hg_complete resolve -d 'Specify merge tool' -s t -l tool -x
__hg_complete resolve -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete resolve -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete resolve -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete resolve -a '(hg_list_unresolved_files "File to resolve")' -x

# Completions for the 'revert' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a revert --description 'Revert files or dirs to their states as of some revision'
# add option completion
__hg_complete revert -d 'Revert all changes when no arguments given' -s a -l all
__hg_complete revert -d 'Tipmost revision matching date' -s d -l date -x
__hg_complete revert -d 'Revert to the specified revision' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete revert -d 'Do not save backup copies of files' -l no-backup
__hg_complete revert -d 'Include names matching given patterns' -s I -l include -x
__hg_complete revert -d 'Exclude names matching given patterns' -s X -l exclude -x
__hg_complete revert -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete revert -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete revert -a '(hg_list_added_files)' -x
__hg_complete revert -a '(hg_list_deleted_files)' -x
__hg_complete revert -a '(hg_list_modified_files)' -x
__hg_complete revert -a '(hg_list_removed_files)' -x

# Completions for the 'rollback' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a rollback --description 'Roll back the last transaction in this repository'
# add option completion
__hg_complete rollback -d 'Do not perform actions, just print output' -s n -l dry-run
__hg_complete rollback -d 'Ignore safety measures' -s f -l force
__hg_complete rollback -d 'Operate on patch repository' -l mq

# Completions for the 'root' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a root --description 'Print the root (top) of the current working dir'
# add option completion
__hg_complete root -d 'Operate on patch repository' -l mq

# Completions for the 'serve' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a serve --description 'Start stand-alone webserver'
# add option completion
__hg_complete serve -d 'Name of access log file to write to' -s A -l accesslog -x
__hg_complete serve -d 'Run server in background' -s d -l daemon
__hg_complete serve -d 'Used internally by daemon mode' -l daemon-pipefds -x
__hg_complete serve -d 'Name of error log file to write to' -s E -l errorlog -x
__hg_complete serve -d 'Port to listen on (default: 8000)' -s p -l port -x
__hg_complete serve -d 'Address to listen on (default: all interfaces)' -s a -l address -x
__hg_complete serve -d 'Name to show in web pages (default: working directory)' -s n -l name -x
__hg_complete serve -d 'Name of the hgweb config file (see "hg help hgweb")' -l webdir-conf -x
__hg_complete serve -d 'Name of file to write process ID to' -l pid-file -x
__hg_complete serve -d 'For remote clients' -l stdio
__hg_complete serve -d 'For remote clients' -l cmdserver -x
__hg_complete serve -d 'Web templates to use' -s t -l templates -x
__hg_complete serve -d 'Template style to use' -l style -x
__hg_complete serve -d 'Use IPv6 in addition to IPv4' -s 6 -l ipv6
__hg_complete serve -d 'SSL certificate file' -l certificate -x
__hg_complete serve -d 'Operate on patch repository' -l mq

# Completions for the 'showconfig' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a showconfig --description 'Show combined config settings from all hgrc files'
# add option completion
__hg_complete showconfig -d 'Show untrusted configuration options' -s u -l untrusted
__hg_complete showconfig -d 'Operate on patch repository' -l mq
# add option completion
__hg_complete showconfig -a '(hg showconfig | sed "s/^\(.*\)=.*/\1\tConfig Item/")' -x
# add alias
__hg_subcommand_alias debugconfig showconfig

# Completions for the 'status' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a status --description 'Show changed files in the working directory'
# add option completion
__hg_complete status -d 'Show status of all files' -s A -l all
__hg_complete status -d 'Show only modified files' -s m -l modified
__hg_complete status -d 'Show only added files' -s a -l added
__hg_complete status -d 'Show only removed files' -s r -l removed
__hg_complete status -d 'Show only deleted (but tracked) files' -s d -l deleted
__hg_complete status -d 'Show only files without changes' -s c -l clean
__hg_complete status -d 'Show only unknown (not tracked) files' -s u -l unknown
__hg_complete status -d 'Show ignored files' -s i -l ignored
__hg_complete status -d 'Hide status prefix' -s n -l no-status
__hg_complete status -d 'Show source of copied files' -s C -l copies
__hg_complete status -d 'End filenames with NUL, for use with xargs' -s 0 -l print0
__hg_complete status -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete status -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete status -d 'Show difference from revision' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete status -d 'List the changed files of a revision' -a '(hg_list_all_changesets)' -s c -l change -x
__hg_complete status -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete status -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete status -a '(hg_list_tracked_files)' -x

# Completions for the 'summary' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a summary --description 'Summarize working directory state'
# add option completion
__hg_complete summary -d 'Check for push and pull' -l remote
__hg_complete summary -d 'Operate on patch repository' -l mq

# Completions for the 'tag' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a tag --description 'Add one or more tags for the current tip or given revision'
# add option completion
__hg_complete tag -d 'Force tag' -s f -l force
__hg_complete tag -d 'Make the tag local' -s l -l local
__hg_complete tag -d 'Revision to tag' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete tag -d 'Remove a tag' -a '(hg_list_tags "Tag to remove")' -l remove -x
__hg_complete tag -d 'Edit commit message' -s e -l edit
__hg_complete tag -d 'Use <text> as commit message' -s m -l message -x
__hg_complete tag -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete tag -d 'Record the specified user as committer' -s u -l user -x
__hg_complete tag -d 'Operate on patch repository' -l mq

# Completions for the 'tags' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a tags --description 'List repository tags'
# add option completion
__hg_complete tags -d 'Operate on patch repository' -l mq

# Completions for the 'tip' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a tip --description 'Show the tip revision'
# add option completion
__hg_complete tip -d 'Show patch' -s p -l patch
__hg_complete tip -d 'Use git extended diff format' -s g -l git
__hg_complete tip -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete tip -d 'Display with template' -l template -x
__hg_complete tip -d 'Operate on patch repository' -l mq

# Completions for the 'unbundle' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a unbundle --description 'Apply one or more changegroup files'
# add option completion
__hg_complete unbundle -d 'Update to new branch head if changesets were unbundled' -s u -l update
__hg_complete unbundle -d 'Operate on patch repository' -l mq

# Completions for the 'update' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a update --description 'Update working directory or switch revisions'
# add option completion
__hg_complete update -d 'Discard uncommitted changes (no backup)' -s C -l clean
__hg_complete update -d 'Update across branches if no uncommitted changes' -s c -l check
__hg_complete update -d 'Tipmost revision matching date' -s d -l date -x
__hg_complete update -d 'Revision to checkout' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete update -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete update -a '(hg_list_all_changesets)' -x
# add alias
__hg_subcommand_alias checkout update
__hg_subcommand_alias co update

# Completions for the 'verify' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a verify --description 'Verify the integrity of the repository'
# add option completion
__hg_complete verify -d 'Operate on patch repository' -l mq

# Completions for the 'version' subcommand {{{1
complete -c hg -n '__fish_use_subcommand' -x -a version --description 'Output version and copyright information'

# Completions for the 'churn' extension {{{1
complete -c hg -n '__fish_use_subcommand' -x -a churn --description 'Histogram of changes to the repository'
# add option completion
__hg_complete churn -d 'Count rate for the specified revision or range' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete churn -d 'Count rate for revisions matching date spec' -s d -l date -x
__hg_complete churn -d 'Template to group changesets (default: {author|email})' -s t -l template -x
__hg_complete churn -d 'Strftime-compatible format for grouping by date' -s f -l dateformat -x
__hg_complete churn -d 'Count rate by number of changesets' -s c -l changesets
__hg_complete churn -d 'Sort by key (default: sort by count)' -s s -l sort
__hg_complete churn -d 'Display added/removed lines separately' -l diffstat
__hg_complete churn -d 'File with email aliases' -l aliases -x
__hg_complete churn -d 'Include names matching given patterns' -s I -l include -x
__hg_complete churn -d 'Exclude names matching given patterns' -s X -l exclude -x
__hg_complete churn -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete churn -a '(hg_list_tracked_files "File to display")' -x

# Completions for the 'gpg' extension {{{1
# subcommand 'sigcheck'
complete -c hg -n '__fish_use_subcommand' -x -a sigcheck --description 'Verify all the signatures there may be for a particular revision'
# add option completion
__hg_complete sigcheck -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete sigcheck -a '(hg_list_signed_changesets)' -x

# subcommand 'sign'
complete -c hg -n '__fish_use_subcommand' -x -a sign --description 'Add a signature for the current or given revision'
# add option completion
__hg_complete sign -d 'Make the signature local' -s l -l local
__hg_complete sign -d 'Sign even if the sigfile is modified' -s f -l force
__hg_complete sign -d 'Do not commit the sigfile after signing' -l no-commit
__hg_complete sign -d 'The key id to sign with' -s k -l key -x
__hg_complete sign -d 'Commit message' -s m -l message -x
__hg_complete sign -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete sign -d 'Record the specified user as committer' -s u -l user -x
__hg_complete sign -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete sign -a '(hg_list_all_changesets)' -x

# subcommand 'sigs'
complete -c hg -n '__fish_use_subcommand' -x -a sigs --description 'List signed changesets'
# add option completion
__hg_complete sigs -d 'Operate on patch repository' -l mq
# Completions for the 'histedit' extension {{{1
complete -c hg -n '__fish_use_subcommand' -x -a histedit --description 'Interactively edit changeset history'
# add option completion
__hg_complete histedit -d 'Read history edits from the specified file' -l commands -x
__hg_complete histedit -d 'Continue an edit already in progress' -s c -l continue
__hg_complete histedit -d 'Do not strip old nodes after edit is complete' -s k -l keep
__hg_complete histedit -d 'Abort an edit in progress' -l abort
__hg_complete histedit -d 'Changesets not found in destination' -s o -l outgoing
__hg_complete histedit -d 'Force outgoing even for unrelated repositories' -s f -l force
__hg_complete histedit -d 'First revision to be edited' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete histedit -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete histedit -a '(hg_list_revs "not public()")' -x

# Completions for the 'mq' extension {{{1
# subcommand 'qapplied' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qapplied --description 'Print the patches already applied'
# add option completion
__hg_complete qapplied -d 'Show only the preceding applied patch' -s 1 -l last
__hg_complete qapplied -d 'Print first line of patch header' -s s -l summary
# add patch completion
__hg_complete qapplied -a '(hg_list_applied_patches)' -x

# subcommand 'qclone' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qclone --description 'Clone main and patch repository at same time'
# add option completion
__hg_complete qclone -d 'Use pull protocol to copy metadata' -l pull
__hg_complete qclone -d 'Do not update the new working directories' -s U -l noupdate
__hg_complete qclone -d 'Use uncompressed transfer (fast over LAN)' -l uncompressed
__hg_complete qclone -d 'Location of source patch repository' -s p -l patches -x
__hg_complete qclone -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete qclone -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete qclone -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure

# subcommand 'qcommit' {{{2
__hg_subcommand_alias qci 'commit --mq'
__hg_subcommand_alias qcommit 'commit --mq'

# subcommand 'qdelete' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qdelete --description 'Remove patches from queue'
# add option completion
__hg_complete qdelete -d 'Keep patch file' -s k -l keep
# add patch completion
__hg_complete qdelete -a '(hg_list_unapplied_patches "Patch to delete")' -x
# add alias
__hg_subcommand_alias qremove qdelete
__hg_subcommand_alias qrm qdelete

# subcommand 'qdiff' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qdiff --description 'Diff of the current patch and subsequent modifications'
# add option completion
__hg_complete qdiff -d 'Treat all files as text' -s a -l text
__hg_complete qdiff -d 'Use git extended diff format' -s g -l git
__hg_complete qdiff -d 'Omit dates from diff headers' -l nodates
__hg_complete qdiff -d 'Show which function each change is in' -s p -l show-function
__hg_complete qdiff -d 'Produce a diff that undoes the changes' -l reverse
__hg_complete qdiff -d 'Ignore white space when comparing lines' -s w -l ignore-all-space
__hg_complete qdiff -d 'Ignore changes in the amount of white space' -s b -l ignore-space-change
__hg_complete qdiff -d 'Ignore changes whose lines are all blank' -s B -l ignore-blank-lines
__hg_complete qdiff -d 'Number of lines of context to show' -s U -l unified -x
__hg_complete qdiff -d 'Output diffstat-style summary of changes' -l stat
__hg_complete qdiff -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete qdiff -d 'Exclude names matching the given patterns' -s X -l exclude -x
# add file name completion
__hg_complete qdiff -a '(hg_list_tracked_files "File to compare")' -x

# subcommand 'qfinish' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qfinish --description 'Move applied patches into repository history'
# add option completion
__hg_complete qfinish -d 'Finish all applied changesets' -s a -l applied
# add patch completion
__hg_complete qfinish -a '(hg_list_applied_patches)' -x

# subcommand 'qfold' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qfold --description 'Fold the named patches into the current patch'
# add option completion
__hg_complete qfold -d 'Edit patch header' -s e -l edit
__hg_complete qfold -d 'Keep folded patch files' -s k -l keep
__hg_complete qfold -d 'Use text as commit message' -s m -l message -x
__hg_complete qfold -d 'Read commit message from file' -s l -l logfile -x
# add patch completion
__hg_complete qfold -a '(hg_list_unapplied_patches "Patch to fold")' -x

# subcommand 'qgoto' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qgoto --description 'Push or pop patches until named patch is at top of stack'
# add option completion
__hg_complete qgoto -d 'Tolerate non-conflicting local changes' -l keep-changes
__hg_complete qgoto -d 'Overwrite any local chagnes' -s f -l force
__hg_complete qgoto -d 'Do not save backup copies of files' -l no-backup
# add patch completion
__hg_complete qgoto -a '(hg_list_applied_patches)' -x
__hg_complete qgoto -a '(hg_list_unapplied_patches)' -x

# subcommand 'qguard' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qguard --description 'Set or print guards for a patch'
# add option completion
__hg_complete qguard -d 'List all patches and guards' -s l -l list
__hg_complete qguard -d 'Drop all guards' -s n -l none
# add patch completion
__hg_complete qguard -a '(hg_list_patches "Patch to guard")' -x

# subcommand 'qheader' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qheader --description 'Print the header of the topmost or specified patch'
# add patch completion
__hg_complete qheader -a '(hg_list_patches)' -x

# subcommand 'qimport' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qimport --description 'Import a patch or existing changeset'
# add option completion
__hg_complete qimport -d 'Import file in patch directory' -s e -l existing
__hg_complete qimport -d 'Name of patch file' -s n -l name -x
__hg_complete qimport -d 'Overwrite existing files' -s f -l force
__hg_complete qimport -d 'Place existing revisions under mq control' -a '(hg_list_revs "not public()")' -s r -l rev -x
__hg_complete qimport -d 'Use git extended diff format' -s g -l git
__hg_complete qimport -d 'qpush after importing' -s P -l push

# subcommand 'qnew' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qnew --description 'Create a new patch'
# add option completion
__hg_complete qnew -d 'Edit commit message' -s e -l edit
__hg_complete qnew -d 'Use git extended diff format' -s g -l git
__hg_complete qnew -d 'Add "From: <current user>" to patch' -s U -l currentuser
__hg_complete qnew -d 'Add "From: <USER>" to patch' -s u -l user -x
__hg_complete qnew -d 'Add "Date: <current date>" to patch' -s D -l currentdate
__hg_complete qnew -d 'Add "Date: <DATE>" to patch' -s d -l date -x
__hg_complete qnew -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete qnew -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete qnew -d 'Use <text> as commit message' -s m -l message -x
__hg_complete qnew -d 'Read commit message from file' -s l -l logfile -x
__hg_complete qnew -d 'Interactively record a new patch' -s i -l interactive

# subcommand 'qnext' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qnext --description 'Print the name of the next pushable patch'
# add option completion
__hg_complete qnext -d 'Print first line of patch header' -s s -l summary

# subcommand 'qpop' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qpop --description 'Pop the current patch off the stack'
# add option completion
__hg_complete qpop -d 'Pop all patches' -s a -l all
__hg_complete qpop -d 'Tolerate non-conflicting local changes' -l keep-changes
__hg_complete qpop -d 'Forget any local changes to patched files' -s f -l force
__hg_complete qpop -d 'Do not save backup copies of files' -l no-backup
# add patch completion
__hg_complete qpop -a '(hg_list_applied_patches)' -x

# subcommand 'qprev' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qprev --description 'Print the name of the preceding applied patch'
# add option completion
__hg_complete qprev -d 'Print first line of patch header' -s s -l summary

# subcommand 'qpush' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qpush --description 'Push the next patch onto the stack'
# add option completion
__hg_complete qpush -d 'Tolerate non-conflicting local changes' -l keep-changes
__hg_complete qpush -d 'Apply on top of local changes' -s f -l force
__hg_complete qpush -d 'Apply the target patch to its recorded parent' -s e -l exact
__hg_complete qpush -d 'List patch name in commit text' -s l -l list
__hg_complete qpush -d 'Apply all patches' -s a -l all
__hg_complete qpush -d 'Reorder patch series and apply only the patch' -l move
__hg_complete qpush -d 'Do not save backup copies of files' -l no-backup
# add patch completion
__hg_complete qpush -a '(hg_list_unapplied_patches)' -x

# subcommand 'qqueue' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qqueue --description 'Manage multiple patch queues'
# add option completion
__hg_complete qqueue -d 'List all available queues' -s l -l list
__hg_complete qqueue -d 'Print name of active queue' -l active
__hg_complete qqueue -d 'Create new queue' -s c -l create
__hg_complete qqueue -d 'Rename active queue' -l rename
__hg_complete qqueue -d 'Delete reference to queue' -l delete
__hg_complete qqueue -d 'Delete queue, and remove patch dir' -l purge
# add queue completion
__hg_complete qqueue -a '(hg_list_patch_queues)' -x

# subcommand 'qrefresh' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qrefresh --description 'Update the current patch'
# add option completion
__hg_complete qrefresh -d 'Edit commit message' -s e -l edit
__hg_complete qrefresh -d 'Use git extended diff format' -s g -l git
__hg_complete qrefresh -d 'Refresh only files already in the patch and specified files' -s s -l short
__hg_complete qrefresh -d 'Add/update author field in patch with current user' -s U -l currentuser
__hg_complete qrefresh -d 'Add/update author field in patch with given user' -s u -l user -x
__hg_complete qrefresh -d 'Add/update date field in patch with current date' -s D -l currentdate
__hg_complete qrefresh -d 'Add/update date field in patch with given date' -s d -l date -x
__hg_complete qrefresh -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete qrefresh -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete qrefresh -d 'Use <text> as commit message' -s m -l message -x
__hg_complete qrefresh -d 'Read commit message from file' -s l -l logfile -x
__hg_complete qrefresh -d 'Interactively select changes to refresh' -s i -l interactive
# add file name completion
__hg_complete qrefresh -a '(hg_list_added_files)' -x
__hg_complete qrefresh -a '(hg_list_modified_files)' -x
__hg_complete qrefresh -a '(hg_list_removed_files)' -x

# subcommand 'qrename' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qrename --description 'Rename a patch'
# add patch completion
__hg_complete qrename -a '(hg_list_patches "Patch to rename")' -x
# add alias
__hg_subcommand_alias qmv qrename

# subcommand 'qselect' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qselect --description 'Set or print guarded patches to push'
# add option completion
__hg_complete qselect -d 'Disable all guards' -s n -l none
__hg_complete qselect -d 'List all guards in series file' -s s -l series
__hg_complete qselect -d 'Pop to before first guarded applied patch' -l pop
__hg_complete qselect -d 'Pop, then reapply patches' -l reapply

# subcommand 'qseries' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qseries --description 'Print the entire series file'
# add option completion
__hg_complete qseries -d 'Print patches not in series' -s m -l missing
__hg_complete qseries -d 'Print first line of patch header' -s s -l summary

# subcommand 'qtop' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qtop --description 'Print the name of the current patch'
# add option completion
__hg_complete qtop -d 'Print first line of patch header' -s s -l summary

# subcommand 'qunapplied' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a qunapplied --description 'Print the patches not yet applied'
# add option completion
__hg_complete qunapplied -d 'Show only the first patch' -s 1 -l first
__hg_complete qunapplied -d 'Print first line of patch header' -s s -l summary

# subcommand 'strip' {{{2
complete -c hg -n '__fish_use_subcommand' -x -a strip --description 'Strip changesets and all their descendants from the repository'
# add option completion
__hg_complete strip -d 'Strip specified revision (optional, can specify revisions without this option)' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete strip -d 'Force removal of changesets, discard uncommitted changes (no backup)' -s f -l force
__hg_complete strip -d 'No backups' -l no-backup
__hg_complete strip -d 'Do not modify working copy during strip' -s k -l keep
__hg_complete strip -d 'Remove revs only reachable from given bookmark' -a '(hg_list_bookmarks "Bookmark to strip")' -s B -l bookmark -x
# add revision completion
__hg_complete strip -a '(hg_list_all_changesets)' -x

# Completions for the 'patchbomb' extension {{{1
complete -c hg -n '__fish_use_subcommand' -x -a email --description 'Send changesets by email'
# add option completion
__hg_complete email -d 'Use git extended diff format' -s g -l git
__hg_complete email -d 'Omit hg patch header' -l plain
__hg_complete email -d 'Send changes not found in the target repository' -s o -l outgoing
__hg_complete email -d 'Send changes not in target as a binary bundle' -s b -l bundle
__hg_complete email -d 'Name of the bundle attachment file (default: bundle)' -l bundlename -x
__hg_complete email -d 'A revision to send' -a '(hg_list_all_changesets)' -s r -l rev -x
__hg_complete email -d 'Run even when remote repository is unrelated (with -b/--bundle)' -l force
__hg_complete email -d 'A base changeset to specify instead of a destination (with -b/--bundle)' -a '(hg_list_all_changesets)' -l base -x
__hg_complete email -d 'Send an introduction email for a single patch' -l intro
__hg_complete email -d 'Send patches as inline message text (default)' -l body
__hg_complete email -d 'Send patches as attachments' -s a -l attach
__hg_complete email -d 'Send patches as inline attachments' -s i -l inline
__hg_complete email -d 'Email addresses of blind carbon copy recipients' -l bcc -x
__hg_complete email -d 'Email addresses of copy recipients' -s c -l cc -x
__hg_complete email -d 'Ask for confirmation before sending' -l confirm
__hg_complete email -d 'Add diffstat output to messages' -s d -l diffstat
__hg_complete email -d 'Use the given date as the sending date' -l date -x
__hg_complete email -d 'Use the given file as the series description' -l desc -x
__hg_complete email -d 'Email address of sender' -s f -l from -x
__hg_complete email -d 'Print messages that would be sent' -s n -l test
__hg_complete email -d 'Write messages to mbox file instead of sending them' -s m -l mbox -x
__hg_complete email -d 'Email addresses replies should be sent to' -l reply-to -x
__hg_complete email -d 'Subject of first message (intro or single patch)' -s s -l subject -x
__hg_complete email -d 'Message identifier to reply to' -l in-reply-to -x
__hg_complete email -d 'Flags to add in subject prefixes' -l flag -x
__hg_complete email -d 'Email addresses of recipients' -s t -l to -x
__hg_complete email -d 'Specify ssh command to use' -s e -l ssh -x
__hg_complete email -d 'Specify hg command to run on the remote side' -l remotecmd -x
__hg_complete email -d 'Do not verify server certificate (ignoring web.cacerts config)' -l insecure
__hg_complete email -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete email -a '(hg_list_paths)' -x

# Completions for the 'purge' extension {{{1
complete -c hg -n '__fish_use_subcommand' -x -a purge --description 'Removes files not tracked by Mercurial'
# add option completion
__hg_complete purge -d 'Abort if an error occurs' -s a -l abort-on-err
__hg_complete purge -d 'Purge ignored files too' -l all
__hg_complete purge -d 'Print filenames instead of deleting them' -s p -l print
__hg_complete purge -d 'End filenames with NUL, for use with xargs (implies -p/--print)' -s 0 -l print0
__hg_complete purge -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete purge -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete purge -d 'Operate on patch repository' -l mq
# add path completion
__hg_complete purge -a '(__fish_complete_directories "" "Directory to purge")' -x
# add alias
__hg_subcommand_alias clean purge

# Completions for the 'rebase' extension {{{1
complete -c hg -n '__fish_use_subcommand' -x -a rebase --description 'Move changeset (and descendants) to a different branch'
set -l __rebase_revset '(hg_list_revs "all() - ancestors(parents()) - descendants(parents()) - public()")'
# add option completion
__hg_complete rebase -d 'Rebase from the specified changeset' -a $__rebase_revset -s s -l source -x
__hg_complete rebase -d 'Rebase from the base of the specified changeset (up to greatest common ancestor of base and dest)' -a $__rebase_revset -s b -l base -x
__hg_complete rebase -d 'Rebase these revisions' -a '(hg_list_revs "not public()")' -s r -l rev -x
__hg_complete rebase -d 'Rebase onto the specified changeset' -a '(hg_list_all_changesets)' -s d -l dest -x
__hg_complete rebase -d 'Collapse the rebased changesets' -l collapse
__hg_complete rebase -d 'Use text as collapse commit message' -s m -l message -x
__hg_complete rebase -d 'Invoke editor on commit messages' -s e -l edit
__hg_complete rebase -d 'Read collapse commit message from file' -s l -l logfile -x
__hg_complete rebase -d 'Keep original changesets' -l keep
__hg_complete rebase -d 'Keep original branch names' -l keepbranches
__hg_complete rebase -d 'Specify merge tool' -s t -l tool -x
__hg_complete rebase -d 'Continue an interrupted rebase' -s c -l continue
__hg_complete rebase -d 'Abort an interrupted rebase' -s a -l abort
__hg_complete rebase -d 'Display using template map file' -a '(hg_list_template_styles)' -l style -x
__hg_complete rebase -d 'Display with template' -l template -x
__hg_complete rebase -d 'Operate on patch repository' -l mq
# add revision completion
__hg_complete rebase -a '(hg_list_all_changesets)' -x

# Completions for the 'record' extension {{{1
complete -c hg -n '__fish_use_subcommand' -x -a record --description 'Interactively select changes to commit'
# add option completion
__hg_complete record -d 'Mark new/missing files as added/removed before committing' -s A -l addremove
__hg_complete record -d 'Mark a branch as closed, hiding it from the branch list' -a '(hg_list_branches "Branch to close")' -l close-branch -x
__hg_complete record -d 'Amend the parent of the working dir' -l amend
__hg_complete record -d 'Use the secret phase for committing' -s s -l secret
__hg_complete record -d 'Include names matching the given patterns' -s I -l include -x
__hg_complete record -d 'Exclude names matching the given patterns' -s X -l exclude -x
__hg_complete record -d 'Use <text> as commit message' -s m -l message -x
__hg_complete record -d 'Read commit message from <file>' -s l -l logfile -x
__hg_complete record -d 'Record the specified date as commit date' -s d -l date -x
__hg_complete record -d 'Record the specified user as committer' -s u -l user -x
__hg_complete record -d 'Recurse into subrepositories' -s S -l subrepos
__hg_complete record -d 'Ignore white space when comparing lines' -s w -l ignore-all-space
__hg_complete record -d 'Ignore changes in the amount of white space' -s b -l ignore-space-change
__hg_complete record -d 'Ignore changes whose lines are all blank' -s B -l ignore-blank-lines
__hg_complete record -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete record -a '(hg_list_added_files)' -x
__hg_complete record -a '(hg_list_modified_files)' -x
__hg_complete record -a '(hg_list_removed_files)' -x
# Completions for the 'shelve' extension {{{1
# shelve
complete -c hg -n '__fish_use_subcommand' -x -a shelve --description 'Save and set aside changes from the working directory'
# add option completion
__hg_complete shelve -d 'Mark new/missing files as added/removed before committing' -s A -l addremove
__hg_complete shelve -d 'Delete all shelved changes' -l cleanup
__hg_complete shelve -d 'Shelve with the specified commit date' -l date -x
__hg_complete shelve -d 'delete the named shelved change(s)' -a '(hg_list_shelves)' -s d -l delete -x
__hg_complete shelve -d 'Use <text> as commit message' -s m -l message -x
__hg_complete shelve -d 'Use the given name for the shelved commit' -s n -l name -x
__hg_complete shelve -d 'Show patch' -s p -l patch
__hg_complete shelve -d 'Output diffstat-style summary of changes' -l stat
__hg_complete shelve -d 'Operate on patch repository' -l mq
# add file name completion
__hg_complete shelve -a '(hg_list_added_files)' -x
__hg_complete shelve -a '(hg_list_modified_files)' -x
__hg_complete shelve -a '(hg_list_removed_files)' -x
# unshelve
complete -c hg -n '__fish_use_subcommand' -x -a unshelve --description 'Restore a shelved change to the working directory'
# add option completion
__hg_complete unshelve -d 'Abort an incomplete unshelve operation' -s a -l abort
__hg_complete unshelve -d 'Continue an incomplete unshelve operation' -s c -l continue
__hg_complete unshelve -d 'Keep shelve after unshelving' -l keep
__hg_complete unshelve -d 'Operate on patch repository' -l mq
# add shelve name completion
__hg_complete unshelve -a '(hg_list_shelves)' -x
