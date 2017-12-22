#!/bin/bash
git ls-files 2>/dev/null || fd --type f
