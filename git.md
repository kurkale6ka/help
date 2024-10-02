# Ranges

## commits
```sh
git log main.. # commits in HEAD only
git log A...B  # commits in B only and in A only
```

## diff
```sh
git diff foo..bar  # changes introduced by both
git diff foo...bar # changes in bar only
```

# Branches

* a branch is a pointer to a commit
* `HEAD` points to the current branch # `git checkout br1` moves `HEAD->br1`
* The `HEAD` branch moves forward when a commit is made

`git ls-remote origin -> refs/heads/main # *heads* refers to 'branches'`

## Track a remote(-tracking) branch (e.g origin/main)

you do that in order to use git pull/push without arguments (implied origin + remote)

note:: `origin/main` is called a remote-tracking branch.
       it's a local reference/pointer that can't be moved

 git checkout -b <branch> <remote>/<branch>
 git checkout --track origin/serverfix
 git checkout serverfix

 git branch -u origin/serverfix
 git push -u origin my-branch # set origin/my-branch (@{u[pstream]}) as upstream for my-branch
                    └─ or HEAD if on the branch

## Prune remote-tracking branches

 git fetch --prune
 git remote prune origin

# Rebase

## rebase experiment onto main => experiment moves/points further ahead

`git rebase main experiment` + or

 git checkout experiment
 git rebase main

## ff merge experiment into main => main catches up with experiment

 git checkout main
 git merge experiment

# Cherry Pick

Cherry picking is the act of picking a commit from a branch and applying it to another.

 a - b - c - d     main (current)
      \
       e - f - g   topic

 git cherry-pick f

 a - b - c - d - f main
      \
       e - f - g   topic

CAUTION:
*`f`* is now a duplicate commit. Only use if `topic` is not to be merged to `main` (i.e. we only need the single commit)

== Index aka staging area

Everything tracked is in your staging area - the index.

`git rm`::
    removes from both the index and the working copy

`git rm --cached`::
    removes from the index only => untracks the file!

=== redo last commit: change index plus/or commit message.

`git commit --amend`::
    same as:
    * `git reset --soft HEAD^`
    * modify staging area
    * `git commit`

_uncommit file example_::
    - `git reset @~ file`
    - `git commit --amend -m'...'`

== git reset

=== reset with a ref (commit) but without a path (file)

[.underline]#Our need is to change the commits...#

1. move the `HEAD->branch` pair to another commit.
2. update index: _stop here by default (change with --*soft*/*hard*)_
3. optionally update the working dir

HEAD (--soft)  ⇒  Index  ⇒  Working dir (--hard)

example 1: `git reset HEAD~`::
    * move `HEAD->branch` to previous commit => undo last commit
    * update index with the snapshot `HEAD->branch` points to => unstage everything

example 2: `git reset main`::
    * move `HEAD->branch` to where `main` points
    * ...

=== reset with a path (and optional commit)

1. [.underline]#Here, commit history isn't the issue, plus changing commit would affect many files => so skip this step#
2. unstage file or more accurately, copy file from HEAD to index

`git reset file`::
    unstage file (opposite of git add file)
`git reset`::
    unstage all files
`git reset --hard`::
    unstage everything + reset working dir

`git checkout main~2 file`::
    update the index + working dir from `main~2` commit (default is `HEAD`)
    `git reset --hard main~2 file` would do the same thing.

== reflog

* it's a *local* history of *all* (no history rewriting as with `git log`) commits
* ring buffer with a limited amount of data (a few months)

== git checkout

=== without paths

`git checkout [commit]`, same as +
`git reset --hard [commit]` but working-dir safe + only moves `HEAD`

=== with paths

`git checkout [commit] file`, same as +
`git reset --hard [commit] file` (but not implemented in `git-reset`)

=== create topic from local main and check it out
`git checkout -b topic main`

same as:

 git branch topic main
 git checkout topic

== refspec

- fetch = `+src(_remote_):dst(_local_)`
- push = `+src(_local_):dst(_remote_)`

`+`: update the reference even if it isn’t a fast-forward

remote branches `refs/heads/\*` go under `refs/remotes/origin/*` locally::
   `fetch = +refs/heads/\*:refs/remotes/origin/*`

_these are equivalent:_

 git push origin serverfix
 git push origin serverfix:serverfix
 git push origin refs/heads/serverfix:refs/heads/serverfix

=== delete remote reference

* `git push origin --delete topic`
* `git push origin :topic` <- push empty `src` to remote

== Operations in bulk

 fd --strip-cwd-prefix -FIH -td .git | parallel --tag --tagstring '{//}' 'git -C {//} branch' | grep -v 'main$'
 fd --strip-cwd-prefix -FIH -td .git | parallel --tag --tagstring '{//}' 'git -c color.status=always -C {//} status -sb'

== Configuration

=== store credentials for use with https

 git config --global credential.https://github.com.*username* kurkale6ka
 git config --global credential.helper store

then `git push` will ask for the token/password

== Glossary

parent commit of `HEAD`::
`HEAD^` or `HEAD~` or `@~`
