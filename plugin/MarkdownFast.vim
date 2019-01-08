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
        while (i < all_buf_len):
            cur_buf[i].replace("　", " ")
            tmp_len_buf = cur_buf[i].strip(' ')

            if not len(tmp_len_buf):
                del vim.current.buffer[i]
                all_buf_len = all_buf_len-1 # becauseof del line
            else:
                vim.current.buffer[i] = tmp_len_buf
                i = i+1

    def addLineBackquote(self):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        vim.current.line = '`' + cur_line_buf + '`'

    def addLineStrong(self):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        vim.current.line = '**' + cur_line_buf + '**'

EOF

command! -nargs=1 MdAddHeader exec('py MdFast().addHeader(<f-args>)')
command! -nargs=0 MdRmSpace exec('py MdFast().rmSpace()')
command! -nargs=0 MdAddLineBackquote exec('py MdFast().addLineBackquote()')
command! -nargs=0 MdAddLineStrong exec('py MdFast().addLineStrong()')
