---
title: 在M1芯片的Mac上安装Python 3.7 
date: 2024-09-23 21:51:07
cover: false
categories: 7788
tags: system
---
在安装吴恩达2022ML的笔记环境时遇到了一些小问题，发现是部分包需要python3.7版本，但是创建python=3.7的conda环境时又发现python3.7太老了，不支持M1芯片的arm64架构，在issue和stackoverflow上找到了解决方案，在此记录。
<!-- more -->

## 问题重现

### 不使用python3.7

正常运行`conda create -n andrew python=3.12`

但运行`pip install -r requirements.txt`时报错：

```bash
note: This error originates from a subprocess, and is likely not a problem with pip.
  ERROR: Failed building wheel for brotlipy
  Running setup.py clean for brotlipy
  error: subprocess-exited-with-error
  
  × python setup.py clean did not run successfully.
  │ exit code: 1
  ╰─> [48 lines of output]
      /opt/miniconda3/envs/andrew/lib/python3.12/site-packages/setuptools/__init__.py:94: _DeprecatedInstaller: setuptools.installer and fetch_build_eggs are deprecated.
      !!
      
              ********************************************************************************
              Requirements should be satisfied by a PEP 517 installer.
              If you are using pip, you can try `pip install --use-pep517`.
              ********************************************************************************
      
      !!
        dist.fetch_build_eggs(dist.setup_requires)
      Traceback (most recent call last):
        ...
      OSError: [Errno 66] Directory not empty: '/private/var/folders/d9/xx71dx5j1p3c9chqs2lkpnjw0000gn/T/pip-install-rd1_nl4f/brotlipy_0b7457beb8c24d688c53258e9d34cc1b/.eggs/cffi-1.17.1-py3.12-macosx-11.1-arm64.egg/cffi-1.17.1.dist-info' -> '/private/var/folders/d9/xx71dx5j1p3c9chqs2lkpnjw0000gn/T/pip-install-rd1_nl4f/brotlipy_0b7457beb8c24d688c53258e9d34cc1b/.eggs/cffi-1.17.1-py3.12-macosx-11.1-arm64.egg/EGG-INFO'
      [end of output]
  
  note: This error originates from a subprocess, and is likely not a problem with pip.
  ERROR: Failed cleaning build dir for brotlipy
Failed to build brotlipy
ERROR: ERROR: Failed to build installable wheels for some pyproject.toml based projects (brotlipy)
```

在issue中查到，包环境需要3.7.6

### 创建python=3.7

`conda create -n andrew python=3.7`

报错：

```bash
Collecting package metadata (current_repodata.json): done
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: failed

PackagesNotFoundError: The following packages are not available from current channels:

  - python==3.7

Current channels:

  - https://conda.anaconda.org/conda-forge/osx-arm64
  - https://conda.anaconda.org/conda-forge/noarch

To search for alternate channels that may provide the conda package you're
looking for, navigate to

    https://anaconda.org

and use the search bar at the top of the page.
```

在stack overflow上查找到原因：Since Python 3.8 had been released for about a year when Apple Silicon hit the market, Python 3.7 builds for osx-arm64 were never part of the regular build matrix for Conda Forge.简单来说就是3.7太老了，不支持苹果M1芯片的osx-arm64架构

## 解决方案

先不指定python版本，创建一个环境后修改架构为osx-64，再安装python3.7

```bash
## create empty environment
conda create -n py37

## activate
conda activate py37

## use x86_64 architecture channel(s)
conda config --env --set subdir osx-64

## install python, numpy, etc. (add more packages here...)
conda install python=3.7

pip install -r requirements.txt

```

成功解决
