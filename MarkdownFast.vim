" check the vim supports python
" test
if !has('python')
    echo 'Error: Required vim compile with +python'
    finish
endif

command! -nargs=1 MdAddHeader exec('py MdFast().addHeader(<f-args>)')

python << EOF
import vim
class MdFast:
    def addHeader(self,lvl):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        print "Lines: {0}".format(len(cur_buf))
        print "Contents: {0}".format(cur_line_buf)
        if '1'==lvl :
            vim.current.line = '# '+cur_line_buf
        elif '2'==lvl :
            vim.current.line = '## '+cur_line_buf
        elif '3'==lvl :
            vim.current.line = '### '+cur_line_buf
        elif '4'==lvl :
            vim.current.line = '#### '+cur_line_buf
        else:
            print "Contents: {0}".format(cur_line_buf)

EOF


function! Foo()
python << EOF
import vim
cur_buf = vim.current.buffer
cur_line_buf = vim.current.line
print "Lines: {0}".format(len(cur_buf))
print "Contents: {0}".format(cur_line_buf)
vim.current.line = '# '+cur_line_buf

# # asdfasdf

EOF
endfunction

