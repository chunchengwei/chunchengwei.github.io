---
title: LeetCode 2
date: 2018-09-25 00:33:00
author: chwei
img: http://static.blinkfox.com/hexoblog_20180925_sql.jpg
categories: Algorithm
tags:
  - LeetCode
---

## 问题描述:

给定两个非空链表代表两个非负整数。数字按逆序存储在每个节点上。求两个数字的和，并按链表的方式返回。

<!--more-->

例如：

> **Input:** (2 -> 4 -> 3) + (5 -> 6 -> 4)
>
> **Output:** 7 -> 0 -> 8
>
> **Explanation:** 342 + 465 = 807.

## 解法:

### 迭代：

首先用迭代的方式，主要是注意边界的处理。这种代码比较长，提交LeetCode后显示代码效率并不高，只能排到30%多。

代码如下：

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        
        ListNode* head = new ListNode(0);
        ListNode* sum = head;
        int carry = 0;
        
        while (l1) {
            
            sum->next = new ListNode(0);
            sum = sum->next;
            
            sum->val = l1->val + l2->val + carry;
            carry = sum->val / 10;
            sum->val = sum->val % 10;
            
            l1 = l1->next;
            l2 = l2->next;
            
            
            if (l2 == NULL) {
                
                
                while (l1) {
                    sum->next = new ListNode((l1->val + carry) % 10);
                    carry = (l1->val + carry) / 10;
                    sum = sum->next;
                    l1 = l1->next;
                }
                
                if (carry)
                    sum->next = new ListNode(carry);
                
                ListNode* temp = head;
                head = head->next;
                delete temp;
                return head;
            }
            
        }
        
        while (l2) {
            sum->next = new ListNode((l2->val + carry) % 10);
            carry = (l2->val + carry) / 10;
            sum = sum->next;
            l2 = l2->next;
        }
        
        if (carry)
            sum->next = new ListNode(carry);
        
        ListNode* temp = head;
        head = head->next;
        delete temp;
        return head;    
    }
};
```

---

### 递归：

另一种方法是用递归。代码简单明了，提交LeetCode后能排到64.48%。

代码如下：

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        return add(l1, l2);
    }
    
    ListNode* add(ListNode* l1, ListNode* l2, int carry = 0) {
        
        if (l1 == NULL && l2 == NULL)
            return carry == 0 ? NULL : new ListNode(carry);
        
        int x = 0, y = 0;
        if (l1 != NULL) {
            x = l1->val;   
            l1 = l1->next;   
        }
        if (l2 != NULL) {
            y = l2->val;   
            l2 = l2->next;   
        }
        
        int sum = x + y + carry;
        carry = sum / 10;
            
        ListNode* curr = new ListNode(sum % 10);
        curr->next = add(l1, l2, carry);
        return curr;
    }
};
```

---

### 大神解法：

下面是LeetCode上大神的解法，我改成了C++版本的，大神的貌似没有删除不用的节点，这样应该会导致内存泄漏。在C++版本中改进了这一点，但是代码效率就降下来了。

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* dummyHead = new ListNode(0);
        ListNode* curr = dummyHead;
        int carry = 0;

        while (l1 != NULL || l2 != NULL) {
            int x = (l1 == NULL) ? 0 : l1->val;
            int y = (l2 == NULL) ? 0 : l2->val;
            int sum = x + y + carry;
            carry = sum / 10;
            
            curr->next = new ListNode(sum % 10);
            curr = curr->next;

            if (l1 != NULL) l1 = l1->next;
            if (l2 != NULL) l2 = l2->next;
        }
        if (carry > 0) 
            curr->next = new ListNode(carry);
        
        // delete not used ListNode. but when add this, runtime beat 34%,
        // when remove this, runtime bests 85.74%
        curr = dummyHead->next;
        delete dummyHead;
        
        return curr;
    }
};
```