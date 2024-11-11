#  Git基础知识回顾

[git可视化练习网站](https://learngitbranching.js.org/)

# 常用命令

## git commit 提交新的改动
git commit 有新的代码改动时用,一般不用
git commit -m'提交信息' 提交代码，同时备注该提交的内容，一般用这个。
git commit --amend 将最新修改提交到最近的一次提交 (比如我已经有个提交，结果发现
还需要修改一部分代码，这部分代码和该提交属于同一个提交，就用git commit --amend)


## git branch 创建新的分支  
比如工程开发到S3了，S3经过测试验证、产品验收，已经完结。
S1 -> S2 -> S3 
这个时候你要继续开发，肯定不能在S3的分支上开发，而是新建一个分支，防止影响原来的代码。
创建dev-S4分支： git branch dev-S4 
用来开发测试环境下S4的功能需求,这样万一出现什么问题，切换回S3分支就行。
S1 -> S2 -> S3 -> dev-S4

git branch -f 分支名A, 将A分支强制重置为代表当前节点的分支

## git checkout 切换结点
好，现在创建了 dev-S4分支， 切换到dev-S4分支上进行S4功能需求的开发。
git checkout dev-S4

创建dev-S4分支，并切换到dev-S4分支上的代码：
git checkout -b dev-S4

等价于 git branch dev-S4   git checkout dev-S4


S1->S2->S3->S4

git checkout HEAD^  往前移动一个结点到 S3
git checkout HEAD~2 往前移动2个节点到 S2


## git merge 合并分支
比如S4迭代在dev-S4分支开发完功能需求后，
进入测试阶段，发现了很多问题。
那我自己就建立一个bug修复的分支 dev-xsh-S4-bug
在该分支修复完bug后，
直接切换到dev-S4分支，
然后
git merge dev-xsh-S4-bug
就可以把我修复bug的提交合并到dev-S4分支上了。
其实它的功能相当于先切换到 dev-S4上(记得要 git pull 一下获取最新的dev-S4代码)
然后 git cherry-pick 相应的bug修复提交 到dev-S4上。
如有冲突就处理冲突。
完成后将dev-S4  最新代码 ， git push 上去，等待code review。


## git rebase 重新改变分支的base
git rebase的功能和 git merge功能相似，都是将2个分支的提交合并。
但是 git merge 会保留历史的提交记录，创造一个新的merge合并的结点。
而 git rebase 不会，可以使得分支更线性，更干净。

git merge 两个分支的最后都指向一个新的合并节点
如 S1->S2->dev-S3->C2->C3   -> 合并节点C4
     ->S2-bug->C1    -> 
     
git rebase 是这样的
如 S1->S2->dev-S3->C2->C3   
     ->S2-bug->C1    
[C1] git rebase C3
 S1->S2->dev-S3->C2->C1->C3   
 
 
 如果我的提交顺序有点乱，比如S1->C1->C3->C2,
 我想让提交出于正确的顺序，可以用rebase调整提交的顺序。
 git rebase -i HEAD~4
 然后会弹出信息，让你修改提交的顺序。
 
 ## Merge 和 Rebase的优缺点
 优点：
 rebase使得提交树变得很干净，所有的提交都在一条线上。
 缺点：
 rebase 修改了提交树的历史
 
 比如C1可以被 rebase 到C3之后，这看起来C1中的工作是在C3之后的
 但实际是在C3之前。
 一些开发人员喜欢保留提交历史，因此更偏爱merge。
而其他人可能更喜欢干净的提交树，于是偏爱rebase。
 
## git reset 撤销修改

比如S1->S2->dev-S4->dev-xsh-S4
我在自己的开发分支  dev-xsh-S4  做完了功能，然后commit一次了。
结果发现有点问题，需要修改原来的提交。
那就
git reset HEAD^
这样就撤销了我的提交成了未提交状态，查看改动的文件方便修改代码。

如果不想保存自己提交的改动，而是撤销到改动前的节点。
直接
git reset --hard HEAD^



## git revert 用一个新的提交撤销修改

如 S1->S2->dev-xsh-S3
执行  git revert HEAD^
结果： S1->S2->dev-xsh-S3   S1->S2->dev-xsh-S3->dev-xsh-S3`

git revert 用于撤销已经提交的更改，如上 dev-xsh-S3 是我的修改，
revert后，dev-xsh-S3`这个提交撤销了我 dev-xsh-S3的修改。
它不会删除历史提交，而是用一个撤销历史更改的commit替代。

## git cherry-pick 抓取某个提交过来

比如我有很多代码提交分散在不同的分支,假设都只有一个commit
dev-xsh1
dev-xsh2
dev-xsh3

在提交代码等待code review前，我希望整合到一个分支上

dev-merge-xsh 就需要有序的包含上面3个分支的提交

拉取远程最新代码到本地分支dev-merge-xsh
然后把各个分支的提交cherry-pick过来
dev-merge-xsh cherry-pick 提交的hash
dev-merge-xsh cherry-pick dev-xsh2（最新提交）
dev-merge-xsh cherry-pick 提交的hash

这样我当天所有的提交都在dev-merge-xsh上了，井然有序。
拿dev-merge-xsh 去做合并到dev的请求，就可以做code review了。


# 远程仓库相关命令

远程仓库并不复杂，实际上就是你的本地仓库在另一台计算机上的拷贝。

这样即使丢失了本地仓库所有信息，也可以通过远程仓库拿回丢失的数据。

远程仓库命名规范 远程分支名字/本地分支名字
一个名为 o/main ，远程仓库名称就是o，本地分支就是main
大多数远程仓库命名都是 origin/main
## git clone 克隆仓库到本地

git clone 远程仓库链接
在本地创建一个远程仓库的拷贝

## git fetch 拉取远程仓库数据

git fetch 的作用
1.从远程仓库下载本地仓库中缺失的提交记录
2.更新远程分支指针如（o/main）

实际上将本地仓库中的远程分支更新成了远程仓库相应分支最新的状态。

git fetch并不会改变本地仓库的状态，不会更新本地的main分支。
很多人误以为执行了git fetch以后，本地仓库就与远程仓库同步了。
但是它只是把远程分支的最新变动下载了下来。

git fetch origin foo 
Git 会到远程仓库的 foo 分支上，然后获取所有本地不存在的提交，放到本地的 o/foo 上。

git fetch origin c2:bar 
Git 将 远程分支C2 的最新提交记录下载到了本地的 bar 分支（一个本地分支）上。

## git pull 抓取远程更新并合并到本地分支上

git pull 命令，专门把远程的更新合并到本地分支。
它等价于
git fetch
+
git merge o/main


git pull origin foo 相当于：

git fetch origin foo; git merge o/foo

还有...

git pull origin bar:bugFix 相当于：

git fetch origin bar:bugFix; git merge bugFix

看到了? git pull 实际上就是 fetch + merge 的缩写, git pull 唯一关注的是提交最终合并到哪里（也就是为 git fetch 所提供的 destination 参数）



## git push 本地更新推送到远程分支

git push 即可，但是通常会遇到冲突
遇到冲突想强制push
就
git push -f

在工作中，常常遇到这种情况，你想git push ，结果远程分支
已经合入了同事的最新代码，这导致的你的代码是基于旧的项目开发的。

所以git push 会被拒绝。

我之前是这样搞的
同步最新的远程分支，然后切到一个新的本地分支 dev-merge-xsh上。
再把我的新提交，一个一个cherry-pick 到dev-merge-xsh上，遇到冲突就解决冲突。

但感觉官网推荐的这种方式更好
git fetch 下载远程仓库的最新更新
git rebase o/main 将本地的最新提交插入到最新分支的后面
git push 同步到远程分支

git pull --rebase 就是上面fetch合rebase的简写。


git push origin main 切换到本地main，再将远程仓库origin找到main., push本地main的最新提交。


git push origin <source>:<destination> 将本地source分支推送到远程分支destination


