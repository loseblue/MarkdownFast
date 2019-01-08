# MarkdownFast
Hotkey for markdonw format in vim

使用快捷键快速修改makrdow格式

## 功能
1. 快速将当前行行设置为标题,可直接设置标题级别.
2. 快速清除开始和结尾的空格
3. 快速清除空行
4. 快速为整行添加代码行格式

## TODO
1. 快速修改当前行标题级别
2. 快速替换中文字符

## Usage

```
map <leader>m1 :MdAddHeader 1<CR>       //<leader> m 1 set curosr line as headline #1
map <leader>m2 :MdAddHeader 2<CR>       //<leader> m 2 set curosr line as headline #2
map <leader>m3 :MdAddHeader 3<CR>       //<leader> m 3 set curosr line as headline #3
map <leader>m4 :MdAddHeader 4<CR>       //<leader> m 4 set curosr line as headline #4

map <leader>m<space> :MdRmSpace<CR>     // <leader> m <space> remove all lines head & tail space AND del empty lines
map <leader>m` :MdAddLineBackquote<CR>  // <leader> m `  add line as code mode
map <leader>m* :MdAddLineStrong<CR>     // <leader> m *  add line as strong
```
