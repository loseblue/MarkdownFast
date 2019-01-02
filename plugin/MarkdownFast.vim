" check the vim supports python
if !has('python')
    echo 'Error: Required vim compile with +python'
    finish
endif

python << EOF
import vim
class MdFast:
    def addHeader(self,lvl):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        # print "Lines: {0}".format(len(cur_buf))
        # print "Contents: {0}".format(cur_line_buf)
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

    def rmSpace(self):
        i = 0
        cur_buf = vim.current.buffer
        all_buf_len = len(vim.current.buffer)
        print "lines: {0}".format(all_buf_len)
        while (i < all_buf_len):
            vim.current.buffer[i] = cur_buf[i].strip()
            vim.current.buffer[i] = cur_buf[i].strip(`　`)
            i = i+1

EOF

command! -nargs=1 MdAddHeader exec('py MdFast().addHeader(<f-args>)')
command! -nargs=0 MdRmSpace exec('py MdFast().rmSpace()')
