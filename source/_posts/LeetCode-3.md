---
title: LeetCode 3
date: 2018-12-01 18:05:12
img: http://static.blinkfox.com/hexoblog_20180925_sql.jpg
categories: Algorithm
tags:
- LeetCode
---

## 问题描述:

给定一个string，找到最长不含有重复字符的字串。返回其长度。

例如：

> ”abcabcbb“的最长不含重复字符的字串是”abc“，长度为3。
>
> ”bbbbb“的最长不含重复字符的字串是”b“，长度为1。
>
> ”pwwkew“的最长不含重复字符的字串是”wke“，长度为3。注意答案要求必须是字串，”pwke“只是子序列不是字串。

## 解法:

### 主要思路：

建立数组length，用来存以当前字符结尾的最长不含重复字符的字串长度。循环字符串，并更新length数组。length中的最大值即为本题答案。

代码如下：

> Runtime: **31 ms**, beats 57.85% of cpp submissions.

```cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        
        if (s.size() == 0) return 0;
        
        int max_end = 0;
        vector<int> length(1, 0);
        
        for (int i=0; i<s.size(); i++) {
            string::iterator p = std::find(s.begin() + i - length.back(), s.begin() + i, s[i]);
            if (p != s.begin() + i)
                length.push_back((int)(s.begin() + i - p));
            else
                length.push_back(length.back() + 1);
            max_end = max(max_end, length.back());
        }
        
        return max_end;
    }
};
```

---

### 大神解法：

还没看，待更新。