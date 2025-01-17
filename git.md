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

_note_: `origin/main` is called a remote-tracking branch. it's a local reference/pointer that can't be moved
```sh
git checkout -b <branch> <remote>/<branch>
git checkout --track origin/serverfix
git checkout serverfix

git branch -u origin/serverfix
git push -u origin my-branch # set origin/my-branch (@{u[pstream]}) as upstream for my-branch
                └─ or HEAD if on the branch
```

## Prune remote-tracking branches
```sh
git fetch --prune
git remote prune origin
```

# Rebase

## rebase experiment onto main => experiment moves/points further ahead

`git rebase main experiment` or
```sh
git checkout experiment
git rebase main
```

## ff merge experiment into main => main catches up with experiment
```sh
git checkout main
git merge experiment
```

# Cherry Pick

Apply any commit to the current branch
```sh
git cherry-pick 3c9b10a # this commit comes from another branch
```
_we now have a duplicate commit (it exists in 2 branches) => only do if you don't want the whole other branch!_

# Index
Everything tracked is in your staging area - _the index_
```sh
git rm --cached # untrack: remove from index
git rm          #      rm: remove from index and working copy
```

## redo last commit: change index plus/or commit message.

`git commit --amend`, same as:
* `git reset --soft HEAD^`
* modify staging area
* `git commit`

_uncommit file example_:
- `git reset @~ file`
- `git commit --amend -m'...'`

# git reset

## reset with a ref (commit) but without a path (file)

<ins>Our need is to change the commits...</ins>
1. move the `HEAD->branch` pair to another commit.
2. update index: _stop here by default (change with --*soft*/*hard*)_
3. optionally update the working dir

HEAD (--soft)  ⇒  Index  ⇒  Working dir (--hard)

_example 1_: `git reset HEAD~`
* move `HEAD->branch` to previous commit => undo last commit
* update index with the snapshot `HEAD->branch` points to => unstage everything

_example 2_: `git reset main`
* move `HEAD->branch` to where `main` points
* ...

## reset with a path (and optional commit)

1. <ins>Here, commit history isn't the issue, plus changing commit would affect many files => so skip this step</ins>
2. unstage file or more accurately, copy file from HEAD to index

* `git reset file`: unstage file (opposite of git add file)
* `git reset`: unstage all files
* `git reset --hard`: unstage everything + reset working dir
* `git checkout main~2 file`: update the index + working dir from `main~2` commit (default is `HEAD`) `git reset --hard main~2 file` would do the same thing.

# reflog

* it's a *local* history of *all* (no history rewriting as with `git log`) commits
* ring buffer with a limited amount of data (a few months)

# git checkout

## without paths

```sh
git checkout [commit]     # same as:
git reset --hard [commit] # but working-dir safe + only moves HEAD
```

## with paths

```sh
git checkout [commit] file     # same as:
git reset --hard [commit] file # but not implemented in git-reset
```

## create topic from local main and check it out
`git checkout -b topic main`

same as:
```sh
git branch topic main
git checkout topic
```

# refspec

- fetch = `+src(_remote_):dst(_local_)`
- push = `+src(_local_):dst(_remote_)`

`+`: update the reference even if it isn’t a fast-forward

remote branches `refs/heads/\*` go under `refs/remotes/origin/*` locally: `fetch = +refs/heads/\*:refs/remotes/origin/*`

_these are equivalent:_
```sh
git push origin serverfix
git push origin serverfix:serverfix
git push origin refs/heads/serverfix:refs/heads/serverfix
```

## delete remote reference

* `git push origin --delete topic`
* `git push origin :topic` <- push empty `src` to remote

# Operations in bulk
```sh
fd --strip-cwd-prefix -FIH -td .git | parallel --tag --tagstring '{//}' 'git -C {//} branch' | grep -v 'main$'
fd --strip-cwd-prefix -FIH -td .git | parallel --tag --tagstring '{//}' 'git -c color.status=always -C {//} status -sb'
```

# Configuration

## store credentials for use with https
```sh
git config --global credential.https://github.com.username kurkale6ka
git config --global credential.helper store
```

then `git push` will ask for the token/password

# Glossary

_parent commit of_ `HEAD`: `HEAD^` or `HEAD~` or `@~`
